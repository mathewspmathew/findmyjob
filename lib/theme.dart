import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: kPrimaryColor,
    textTheme: textTheme(),
    scaffoldBackgroundColor: kScaffoldBackgroundColor,
    fontFamily: GoogleFonts.nunito().fontFamily,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
  );
}

TextTheme textTheme() {
  return TextTheme(
    headline4: TextStyle(color: kTextColor),
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
    subtitle1: TextStyle(color: kTextColor.withOpacity(0.6)),
    subtitle2: TextStyle(color: kTextColor.withOpacity(0.6)),
  );
}
