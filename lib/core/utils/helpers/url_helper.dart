

import 'package:flutter_clean_architecture/config/url_configuration.dart';
import 'package:flutter_clean_architecture/core/utils/helpers/helper_interface.dart';

class UrlHelper implements Helper {
  const UrlHelper._();
  static const UrlHelper instance = UrlHelper._();

  String apiUrl({String url = ''}) {
    final String baseUrl = UrlConfiguration.baseURL;
    return '$baseUrl$url';
  }
  

}
