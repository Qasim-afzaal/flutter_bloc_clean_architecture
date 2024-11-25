
import 'package:flutter_clean_architecture/core/utils/helpers/image_helper.dart';
import 'package:flutter_clean_architecture/core/utils/helpers/snackbar_helper.dart';
import 'package:flutter_clean_architecture/core/utils/helpers/url_helper.dart';

class Helpers {
  const Helpers._();

  static const Helpers instance = Helpers._();

  static ImageHelper get images => ImageHelper.instance;
  static SnackbarHelper get snackbars => SnackbarHelper.instance;
  static UrlHelper get url => UrlHelper.instance;
}
