import 'dart:math';

import 'package:flutter_clean_architecture/core/utils/helpers/helper_interface.dart';

class ImageHelper implements Helper {
  const ImageHelper._();
  static const ImageHelper instance = ImageHelper._();

  String randomMockImageString() {
    Random random = Random();
    int randomNumber = random.nextInt(16 - 1) + 1;
    return 'assets/images/mock_listings/listing-$randomNumber.png';
  }

  
}
