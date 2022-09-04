import 'dart:io';

import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isPlatform = false;
  bool switchValue2 = false;
  double sliderValue = 0.0;
  String radioValue = 'Male';

  /// this function will change platform type
  platformType(value) {
    isPlatform = value;
    if (isPlatform == false) {
      Platform.isAndroid;
    } else {
      Platform.isIOS;
    }
    update();
  }

  /// this function will change switch value
  onSwitchTap(value) {
    switchValue2 = value;
    update();
  }

  /// this function will change slider value
  onSlider(value) {
    sliderValue = value;
    update();
  }

  /// this function will change radio button value
  radioButton(value) {
    radioValue = value;
    update();
  }
}
