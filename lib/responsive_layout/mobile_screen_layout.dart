import 'package:flutter/material.dart';
import 'package:google_clone/widget/mobile/mobile_footer.dart';
import '../utilities/colors.dart';
import '../widget/search.dart';
import '../widget/translation_button.dart';
import '../widget/web/search_buttons.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: primaryColor,
            ),
            onPressed: () {},
          ),
          title: SizedBox(
            width: size.width * 0.34,
            child: const DefaultTabController(
              length: 2,
              child: TabBar(
                labelColor: blueColor,
                unselectedLabelColor: Colors.grey,
                indicatorColor: blueColor,
                tabs: [
                  Tab(text: 'ALL'),
                  Tab(text: 'IMAGES'),
                ],
              ),
            ),
          ),
          actions: [
            // IconButton(
            //   icon: SvgPicture.asset('assets/images/more-apps.svg',
            //       color: primaryColor),
            //   onPressed: () {},
            // ),
            // const SizedBox(width: 10),
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: const [
                          Search(),
                          SizedBox(height: 20),
                          TranslationButtons(),
                        ],
                      ),
                      const MobileFooter(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
