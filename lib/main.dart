import 'package:flutter/material.dart';
import 'package:google_clone/responsive_layout/mobile_screen_layout.dart';
import 'package:google_clone/responsive_layout/responsive_screen_layout.dart';
import 'package:google_clone/responsive_layout/web_screen_layout.dart';
import 'package:google_clone/utilities/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Clone',
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: const ResponsiveScreenLayout(
        webScreenLayout: WebScreenLayout(),
        mobScreenLayout: MobileScreenLayout(),
      ),
    );
  }
}
