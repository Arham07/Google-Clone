import 'package:flutter/material.dart';
import 'package:google_clone/utilities/colors.dart';
import 'package:google_clone/widget/search_header.dart';

import '../widget/search_footer.dart';
import '../widget/search_tabs.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchHeader(),
            Padding(
              padding: EdgeInsets.only(left: size.width < 768 ? 15.0 : 150.0),
              child: const SearchTabs(),
            ),
            const Divider(
              height: 0,
              thickness: 0.3,
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      '< Prev',
                      style: TextStyle(color: blueColor, fontSize: 15),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Next >',
                      style: TextStyle(color: blueColor, fontSize: 15),
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 30),
            const SearchFooter()
          ],
        ),
      ),
    );
  }
}
