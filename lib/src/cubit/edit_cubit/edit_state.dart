import 'package:flutter/material.dart';

import '../../widgets/custom/stickerText/models/editable_items.dart';

abstract class EditPageState {}

class EditPageInit extends EditPageState {}

class EditPageSuccess extends EditPageState {}

class EditPageError extends EditPageState {}

class EditTextState extends EditPageState {
  EditableItem? activeItem;
  Offset initPos = const Offset(0, 0);
  Offset currentPos = const Offset(0, 0);
  double currentScale = 1;
  double currentRotation = 0;
  bool inAction = false;
  bool isTextInput = false;
  String currentText = '';
  Color selectedTextColor = const Color(0xffffffff);
  int selectedTextBackgroundGradient = 0;
  double selectedFontSize = 26;
  int selectedFontFamily = 0;
  bool isDeletePosition = false;
  bool isColorPickerSelected = false;
  late PageController familyPageController;
  late PageController textColorsPageController;
  late PageController gradientsPageController;
  /* EditTextState({
    this.activeItem,
    this.initPos,
    required this.currentPos,
    required this.currentScale,
    required this.currentRotation,
    required this.inAction,
    required this.isTextInput,
    required this.currentText,
    required this.selectedTextColor,
    required this.selectedTextBackgroundGradient,
    required this.selectedFontSize,
    required this.selectedFontFamily,
    required this.isDeletePosition,
    this.isColorPickerSelected,
   this.familyPageController,
    required this.textColorsPageController,
    required this.gradientsPageController,
  });*/
}
