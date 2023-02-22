import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'styles.dart';

class MyTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0XFFFFFFFF),
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18,
          letterSpacing: -0.41,
          color: const Color(0xff000000).withOpacity(0.49),
        ),
        bodyMedium: const TextStyle(
          fontWeight: FontWeight.w100,
          fontSize: 14,
          letterSpacing: -0.41,
          color: Color(0xff000000),
        ),
        headlineMedium: const TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.41,
          fontSize: 36,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(14),
        hintStyle: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 17,
          letterSpacing: -0.41,
          color: const Color(0xff000000).withOpacity(0.49),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Color(0xffB5B5B5),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: kPrimaryColor,
            width: 1.5,
          ),
        ),
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(kPrimaryColor),
          padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 14)),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
        secondary: kPrimaryColor,
      ),
    );
  }
}
