import "package:flutter/material.dart";

class QSize {
  static late MediaQueryData _mediaQueryData;
  static late double screenHeight;
  static late double screenWidth;
  static late double statusBarHeight;
  static late bool isTab;
  static late bool isWeb;

  QSize();

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    statusBarHeight = _mediaQueryData.padding.top;

    /// To check whether the device is tablet or not
    isTab = _mediaQueryData.size.shortestSide < 600 ? false : true;
    if (_mediaQueryData.size.width > 600 && _mediaQueryData.size.width < 940) {
      isTab = true;
      isWeb = false;
    } else {
      isTab = false;
    }
    if (_mediaQueryData.size.width >= 940) {
      isWeb = true;
      isTab = false;
    } else {
      isWeb = false;
    }
  }
}
