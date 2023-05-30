import 'package:flutter/material.dart';

import '../constants/item_type.dart';

class EditableItem {
  Offset position = const Offset(0.0, 0.2);
  double scale = 1;
  double rotation = 0;
  ItemType type = ItemType.TEXT;
  String? image;
  String value = '';
  TextEditingController textEditingController = TextEditingController();
  Color color = Colors.transparent;
  int textStyle = 0;
  double fontSize = 14;
  int fontFamily = 0;
  TextAlign textAlign = TextAlign.center;
}
