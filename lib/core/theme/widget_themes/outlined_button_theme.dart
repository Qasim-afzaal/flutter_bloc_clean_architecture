import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/theme/color_schemes.g.dart';


class AppOutlinedButtonTheme {
  AppOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: lightColorScheme.primary,
      backgroundColor: lightColorScheme.background,
      side: BorderSide(color: lightColorScheme.primary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: darkColorScheme.primary,
      backgroundColor: darkColorScheme.background,
      side: BorderSide(color: darkColorScheme.primary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
