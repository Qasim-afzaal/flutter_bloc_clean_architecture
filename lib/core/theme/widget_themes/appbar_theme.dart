import 'package:flutter/material.dart';

class AppAppBarTheme {
AppAppBarTheme._();

  static AppBarTheme lightAppBarTheme = const AppBarTheme(
    elevation: 0,
    centerTitle: false,
    iconTheme: IconThemeData(
      size: 18.0,
    ),
    actionsIconTheme: IconThemeData(
      size: 18.0,
    ),
  );

  static AppBarTheme darkAppBarTheme = const AppBarTheme(
    elevation: 0,
    centerTitle: false,
    iconTheme: IconThemeData(
      size: 18.0,
    ),
    actionsIconTheme: IconThemeData(
      size: 18.0,
    ),
  );
}
