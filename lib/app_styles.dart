import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
// ColorSchemes

  // primary -> Primary Color: White
  // secondary -> Accent Color: Blue
  // tertiary -> Disabled Color: Grey
  // inversePrimary -> Opposite to White: Black
  // background -> Screen Bg Color: Off-White

  static final ColorScheme colorScheme =
      ColorScheme.fromSeed(seedColor: const Color(0xffFFFFFF)).copyWith(
    primary: const Color(0xffFFFFFF),
    secondary: const Color(0xff007AFF),
    tertiary: const Color(0xffB3B3B3),
    inversePrimary: const Color(0xff313144),
    background: const Color(0xffF8F8F8),
  );

// TextStyles

  // Headline-Large
  static final TextStyle headline1 = GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.w700, //bold
    color: colorScheme.inversePrimary, //black
  );

  // Headline-Medium
  static final TextStyle headline2 = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600, // semibold
    color: colorScheme.inversePrimary, //black
  );

  // Headline-Small
  static final TextStyle headline3 = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w600, // semibold
    color: colorScheme.inversePrimary, //black
  );

  static final TextStyle bodyText1 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400, // regular
    color: const Color(0xff808080), //grey
  );

  static final TextStyle bodyText2 = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400, //regular
    color: colorScheme.inversePrimary, //black
  );

  static final TextStyle bodyText3 = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400, //regular
    color: colorScheme.inversePrimary, //black
  );

  // Add more styles as needed...
}
