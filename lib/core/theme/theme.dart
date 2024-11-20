import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/theme/widget_themes/text_field_theme.dart';
import 'package:flutter_clean_architecture/core/theme/widget_themes/text_theme.dart';


import 'color_schemes.g.dart';
import 'extension_themes/custom_colors_theme.dart';
import 'extension_themes/custom_image_strings_theme.dart';
import 'extension_themes/custom_sizes_theme.dart';
import 'widget_themes/appbar_theme.dart';
import 'widget_themes/elevated_button_theme.dart';
import 'widget_themes/filled_button_theme.dart';
import 'widget_themes/outlined_button_theme.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    brightness: lightColorScheme.brightness,
    appBarTheme: AppAppBarTheme.lightAppBarTheme,
    textTheme: AppTextTheme.textTheme,
    inputDecorationTheme: TextFormFieldTheme.lightInputDecorationTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme:AppOutlinedButtonTheme.lightOutlinedButtonTheme,
    filledButtonTheme:AppFilledButtonTheme.lightElevatedButtonTheme,
    extensions: const [
      CustomSizesTheme.lightTheme,
      CustomColorsTheme.lightTheme,
      CustomImageStringsTheme.lightTheme,
    ],
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
    brightness: darkColorScheme.brightness,
    appBarTheme: AppAppBarTheme.darkAppBarTheme,
    textTheme: AppTextTheme.textTheme,
    inputDecorationTheme:TextFormFieldTheme.darkInputDecorationTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.darkOutlinedButtonTheme,
    filledButtonTheme:AppFilledButtonTheme.darkElevatedButtonTheme,
    extensions: const [
      CustomSizesTheme.darkTheme,
      CustomColorsTheme.darkTheme,
      CustomImageStringsTheme.darkTheme,
    ],
  );
}
