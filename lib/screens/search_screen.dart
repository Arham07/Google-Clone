import 'package:flutter/material.dart';
import 'package:google_clone/services/api_services.dart';
import 'package:google_clone/utilities/colors.dart';
import 'package:google_clone/widget/search_header.dart';
import '../widget/search_footer.dart';
import '../widget/search_result_components.dart';
import '../widget/search_tabs.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery;
  final String start;
  const SearchScreen({Key? key, required this.searchQuery, this.start = '0'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Title(
        color: Colors.blue,
        title: searchQuery,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchHeader(),
                Padding(
                  padding: EdgeInsets.only(left: size.width <= 768 ? 10 : 150.0),
                  child: const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SearchTabs(),
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 0,
                ),
                // showing search results
                FutureBuilder<Map<String, dynamic>>(
                  future: ApiService().fetchData(
                      context: context, queryTerm: searchQuery, start: start),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      //
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // showing the time it took to fetch results
                          Container(
                            padding: EdgeInsets.only(
                                left: size.width <= 768 ? 10 : 150, top: 28),
                            child: Center(
                              child: Text(
                                "About ${snapshot.data?['searchInformation']['formattedTotalResults']} results (${snapshot.data?['searchInformation']['formattedSearchTime']} seconds)",
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF70757a),
                                ),
                              ),
                            ),
                          ),
                          // displaying the results
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data?['items'].length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: size.width <= 768 ? 10 : 150),
                                child: SearchResultComponent(
                                  linkToGo: snapshot.data?['items'][index]
                                      ['link'],
                                  link: snapshot.data?['items'][index]
                                      ['formattedUrl'],
                                  text: snapshot.data?['items'][index]['title'],
                                  desc: snapshot.data?['items'][index]['snippet'],
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 30),
                          // pagination
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: start != "0"
                                        ? () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SearchScreen(
                                                searchQuery: searchQuery,
                                                start: (int.parse(start) - 10)
                                                    .toString(),
                                              ),
                                        ),
                                      );
                                    }
                                        : () {},
                                    child: const Text(
                                      "< Prev",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: blueColor,
                                      ),
                                    )),
                                const SizedBox(width: 30),
                                TextButton(
                                  child: const Text(
                                    "Next >",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: blueColor,
                                    ),
                                  ),
                                  // if start is 0, we are on the first page
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SearchScreen(
                                          searchQuery: searchQuery,
                                          start:
                                          (int.parse(start) + 10).toString(),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          const SearchFooter(),
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
