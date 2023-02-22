import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xff3A4DF9);

TextStyle btnTextStyle(BuildContext context) =>
    Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 17,
          letterSpacing: -0.41,
        );

TextStyle titleTextStyle(BuildContext context) => const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      letterSpacing: -0.41,
      color: Color(0xff000000),
    );
