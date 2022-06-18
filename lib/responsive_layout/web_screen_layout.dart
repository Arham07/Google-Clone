import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_clone/widget/web/web_footer.dart';

import '../utilities/colors.dart';
import '../widget/search.dart';
import '../widget/translation_button.dart';
import '../widget/web/search_buttons.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'Gmail',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Images',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
                icon: SvgPicture.asset('assets/images/more-apps.svg',
                    color: primaryColor),
                onPressed: () {}),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10).copyWith(
                right: 10,
              ),
              child: MaterialButton(
                onPressed: () {},
                color: const Color(0xff1A73EB),
                child: const Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.25),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // since children of column are not supposed to be 'spaced between'
                    Column(
                      children: [
                        const Search(),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        const SearchButtons(),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        const TranslationButtons(),
                      ],
                    ),
                    const WebFooter(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
