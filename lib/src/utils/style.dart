import 'package:flutter/material.dart';
import 'package:sticker_maker/src/utils/values.dart';

import './utils_index.dart';

class AppStyle {
  AppStyle._();
  //DEFAULT STYLE
  static const DEFAULT_6 = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: AppValue.FONT_SIZE_6,
      color: Colors.black,
      height: 1.4);

  static const DEFAULT_12 = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: AppValue.FONT_SIZE_12,
      color: Colors.white,
      height: 1.4);

  static const DEFAULT_14 = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: AppValue.FONT_SIZE_14,
      color: Colors.white,
      height: 1.4);

  static const DEFAULT_16 = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: AppValue.FONT_SIZE_16,
      color: Colors.white,
      height: 1.4);

  static const DEFAULT_18 = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: AppValue.FONT_SIZE_18,
      color: Colors.black,
      height: 1.4);

  static const DEFAULT_20 = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: AppValue.FONT_SIZE_20,
      color: Colors.black,
      height: 1.4);

  static const DEFAULT_24 = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: AppValue.FONT_SIZE_24,
      color: Colors.white,
      height: 1.4);

  //DEFAULT STYLE MIX
  // ignore: non_constant_identifier_names
  static final DEFAULT_12_BOLD =
  DEFAULT_12.copyWith(fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static final DEFAULT_14_BOLD =
  DEFAULT_14.copyWith(fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static final DEFAULT_16_BOLD =
  DEFAULT_16.copyWith(fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static final DEFAULT_18_BOLD =
  DEFAULT_18.copyWith(fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static final DEFAULT_20_BOLD =
  DEFAULT_20.copyWith(fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static final DEFAULT_24_BOLD =
  DEFAULT_24.copyWith(fontWeight: FontWeight.bold);
}
