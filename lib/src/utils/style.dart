// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sticker_maker/src/utils/values.dart';

import './utils_index.dart';

class AppStyle {
  AppStyle._();
  //DEFAULT STYLE
  static const DEFAULT_6 =
      TextStyle(fontFamily: 'Montserrat', fontSize: AppValue.FONT_SIZE_6, color: Colors.black, height: 1.4);

  static const DEFAULT_12 =
      TextStyle(fontFamily: 'Montserrat', fontSize: AppValue.FONT_SIZE_12, color: Colors.white, height: 1.4);

  static const DEFAULT_14 =
      TextStyle(fontFamily: 'Montserrat', fontSize: AppValue.FONT_SIZE_14, color: Colors.white, height: 1.4);

  static const DEFAULT_16 =
      TextStyle(fontFamily: 'Montserrat', fontSize: AppValue.FONT_SIZE_16, color: Colors.white, height: 1.4);

  static const DEFAULT_18 =
      TextStyle(fontFamily: 'Montserrat', fontSize: AppValue.FONT_SIZE_18, color: Colors.black, height: 1.4);

  static const DEFAULT_20 =
      TextStyle(fontFamily: 'Montserrat', fontSize: AppValue.FONT_SIZE_20, color: Colors.black, height: 1.4);

  static const DEFAULT_24 =
      TextStyle(fontFamily: 'Montserrat', fontSize: AppValue.FONT_SIZE_24, color: Colors.white, height: 1.4);

  static const DEFAUlT_LABEL = TextStyle(fontFamily: 'Nunito', fontSize: 24, fontWeight: FontWeight.w800);
  static const DEFAUlT_LABELBACK = TextStyle(fontFamily: 'Nunito', fontSize: 18, fontWeight: FontWeight.w800);
  static const DEFAUlT_LABELBACK_FEED = TextStyle(fontFamily: 'Nunito', fontSize: 16, fontWeight: FontWeight.w600);
  static const DEFAUlT_CONTENT = TextStyle(fontFamily: 'Nunito', fontSize: 16, fontWeight: FontWeight.w700);
  static const DEFAUlT_CONTENT_TEXT = TextStyle(fontFamily: 'Nunito', fontSize: 12, fontWeight: FontWeight.w500);
  static const DEFAUlT_CONTENT_TEXT_FEED_SOCIALMEDIA =
      TextStyle(fontFamily: 'Nunito', fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white);
  static const DEFAUlT_CONTENT_TEXT_FEED_SHARE_SOCIALMEDIA =
      TextStyle(fontFamily: 'Nunito', fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white);
  static const DEFAUlT_CONTENT_TEXT_SPAN =
      TextStyle(fontFamily: 'Nunito', fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black);
  static const DEFAUlT_CONTENT_TEXT_SPAN_FEED =
      TextStyle(fontFamily: 'Nunito', fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black);
  static const DEFAUlT_CONTENT_BTN_APPLY =
      TextStyle(fontFamily: 'Nunito', fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black);
  static const DEFAUlT_CONTENT_BTN_APPLY_D =
      TextStyle(fontFamily: 'Nunito', fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFFBBBBBB));
  static const DEFAUlT_CONTENT_TEXT_NOR =
      TextStyle(fontFamily: 'Nunito', fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black);
  static const DEFAUlT_CONTENT_TEXT_TAIL =
      TextStyle(fontFamily: 'Nunito', fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF6B6B6B));
  static const DEFAUlT_CONTENT_TEXT_SETTINGSFEED =
      TextStyle(fontFamily: 'Nunito', fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFFCDC7C7));

  //DEFAULT STYLE MIX
  // ignore: non_constant_identifier_names
  static final DEFAULT_12_BOLD = DEFAULT_12.copyWith(fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static final DEFAULT_14_BOLD = DEFAULT_14.copyWith(fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static final DEFAULT_16_BOLD = DEFAULT_16.copyWith(fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static final DEFAULT_18_BOLD = DEFAULT_18.copyWith(fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static final DEFAULT_20_BOLD = DEFAULT_20.copyWith(fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static final DEFAULT_24_BOLD = DEFAULT_24.copyWith(fontWeight: FontWeight.bold);
}
