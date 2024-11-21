import 'package:flutter_clean_architecture/core/theme/extensions/custom_image_strings.dart';

class CustomImageStringsTheme {
  CustomImageStringsTheme._();

  static const CustomImageStrings lightTheme = CustomImageStrings(
    appLogo: 'assets/images/logo-purple.png',
  );

  static const CustomImageStrings darkTheme = CustomImageStrings(
    appLogo: 'assets/images/logo.png',
  );
}
