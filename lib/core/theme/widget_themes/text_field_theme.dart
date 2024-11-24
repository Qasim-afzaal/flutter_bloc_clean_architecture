import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/theme/color_schemes.g.dart';


class TextFormFieldTheme {
 TextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    prefixIconColor: lightColorScheme.primary,
    floatingLabelStyle: TextStyle(color: lightColorScheme.primary),
    isDense: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        width: 1,
        color: lightColorScheme.outline,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        width: 1,
        color: lightColorScheme.outline,
      ),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    prefixIconColor: darkColorScheme.primary,
    floatingLabelStyle: TextStyle(color: darkColorScheme.primary),
    isDense: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        width: 1,
        color: darkColorScheme.outline,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        width: 1,
        color: darkColorScheme.outline,
      ),
    ),
  );
}
