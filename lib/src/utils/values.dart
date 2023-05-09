import 'dart:convert';
import 'dart:io' show File, Platform;
import 'dart:ui';

import 'package:flutter/material.dart';

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

class AppValue {
  AppValue._();
  static const FONT_SIZE_6 = 6.0;
  static const FONT_SIZE_10 = 10.0;
  static const FONT_SIZE_12 = 12.0;
  static const FONT_SIZE_14 = 14.0;
  static const FONT_SIZE_16 = 16.0;
  static const FONT_SIZE_18 = 18.0;
  static const FONT_SIZE_20 = 20.0;
  static const FONT_SIZE_24 = 24.0;

  static const Widget kEmptyWidget = SizedBox();

  static Widget hSpace(double width) => SizedBox(width: width);
  static const Widget hSpaceTiny = SizedBox(width: 8.0);
  static const Widget hdistance = SizedBox(width: 11.0);
  static const Widget hSpaceVrTiny = SizedBox(width: 4.0);
  static const Widget hSpaceSmall = SizedBox(width: 16.0);
  static const Widget hSpaceMedium = SizedBox(width: 32.0);

  static Widget vSpace(double height) => SizedBox(height: height);
  static const Widget vSpaceVrTiny = SizedBox(height: 4.0);
  static const Widget vSpaceTiny = SizedBox(height: 8.0);
  static const Widget vdistance = SizedBox(height: 9.0);
  static const Widget vSpaceSmall = SizedBox(height: 16.0);
  static const Widget vSpaceMedium = SizedBox(height: 32.0);
  static const Widget vSpaceLarge = SizedBox(height: 64.0);
  static const Widget vSpaceMassive = SizedBox(height: 128.0);

  static double widths = MediaQueryData.fromWindow(window).size.width;
  static double heights = MediaQueryData.fromWindow(window).size.height;

  static bool isIOS() => Platform.isIOS;

  static String convertFileToBase64(File? file) {
    if (file == null) {
      return '';
    }
    List<int> imageBytes = file.readAsBytesSync();
    print(imageBytes);
    return base64Encode(imageBytes);
  }
}
