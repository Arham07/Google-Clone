import 'package:flutter/material.dart';
import 'package:google_clone/responsive_layout/mobile_screen_layout.dart';
import 'package:google_clone/responsive_layout/web_screen_layout.dart';

class ResponsiveScreenLayout extends StatefulWidget {
  final Widget mobScreenLayout;
  final Widget webScreenLayout;

  const ResponsiveScreenLayout(
      {Key? key, required this.mobScreenLayout, required this.webScreenLayout})
      : super(key: key);

  @override
  State<ResponsiveScreenLayout> createState() => _ResponsiveScreenLayoutState();
}

class _ResponsiveScreenLayoutState extends State<ResponsiveScreenLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 780) {
          return const MobileScreenLayout();
        }
        return const WebScreenLayout();
      },
    );
  }
}
