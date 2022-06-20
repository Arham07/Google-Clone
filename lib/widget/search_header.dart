import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_clone/screens/search_screen.dart';
import '../utilities/colors.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: size.width < 768
          ? EdgeInsets.only(top: size.height * 0.08)
          : EdgeInsets.only(top: size.height * 0.05),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 28.0, right: 0, top: 4),
            child: Image.asset(
              'assets/images/google-logo.png',
              height: 30,
              width: 92,
            ),
          ),
          SizedBox(
              width: size.width < 768 ? size.width * 0.05 : size.width * 0.035),
          Container(
            width: size.width * 0.55,
            decoration: BoxDecoration(
              color: searchColor,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: searchColor,
              ),
            ),
            height: 44,
            child: TextField(
              // onSubmitted: (text) {
                // if (text.trim() != "") {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => SearchScreen(
                //       searchQuery: text.trim(),
                //     ),
                //   ),
                // );
                // }
                onSubmitted: (query) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(searchQuery: query, start: '0',),
                    ),
                  );
                },
              // },
              style: const TextStyle(fontSize: 16),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(

                suffixIcon: Container(
                  constraints: const BoxConstraints(maxWidth: 150),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/images/mic-icon.svg',
                          height: 22,
                          width: 20,
                        ),
                        SizedBox(width: size.width < 768 ? 10 : 15),
                        const Icon(
                          Icons.search,
                          color: blueColor,
                        ),
                      ],
                    ),
                  ),
                ),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
