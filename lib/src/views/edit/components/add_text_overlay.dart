import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sticker_maker/src/utils/utils_index.dart';

import '../../../widgets/custom/custom.dart';

class AddTextOverlay extends StatefulWidget {
  final Function onClickDone;
  final FocusNode textFocusNode;
  final List<EditableItem> stackData;
  final TextEditingController textEditingController;
  Color selectedTextColor;
  int selectedFontFamily;
  double selectedFontSize;
  int selectedTextBackgroundGradient;
  Offset position;
  double scale;
  double rotation;
  AddTextOverlay(
      {Key? key,
      required this.onClickDone,
      required this.textFocusNode,
      required this.stackData,
      required this.textEditingController,
      required this.selectedFontFamily,
      required this.selectedFontSize,
      required this.selectedTextColor,
      required this.selectedTextBackgroundGradient,
      required this.position,
      required this.scale,
      required this.rotation})
      : super(key: key);

  @override
  State<AddTextOverlay> createState() => _AddTextOverlayState();
}

class _AddTextOverlayState extends State<AddTextOverlay> {
  bool _isTextInput = false;
  EditableItem? _activeItem;
  String _currentText = '';

  bool _isChangeTextFont = false;
  TextAlign _selectedTextAlign = TextAlign.center;
  AlignmentGeometry _selectedAlignWidget = Alignment.center;
  final bool _isAligntext = false;
  bool _isChangeColorText = false;
  bool _isChangeTextBackground = false;
  late PageController _familyPageController;
  late PageController _textColorsPageController;
  late PageController _gradientsPageController;

  bool _isDrawing = false;

  @override
  void initState() {
    // TODO: implement initState
    widget.textFocusNode.requestFocus();
    _familyPageController = PageController(viewportFraction: .125);
    _textColorsPageController = PageController(viewportFraction: .1);
    _gradientsPageController = PageController(viewportFraction: .175);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: context.height,
        width: context.width,
        color: Colors.black.withOpacity(0.4),
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            InkWell(
                overlayColor: MaterialStateColor.resolveWith(
                    (states) => Colors.transparent),
                onTap: _onAddText,
                child: SizedBox(
                  height: AppValue.heights,
                  width: AppValue.widths,
                )),
            TopToolsWidget(
              // onCancel: _onCancel,
              onDone: _onAddText,
              isTextInput: _isTextInput,
              animationsDuration: const Duration(milliseconds: 300),
              selectedTextBackgroundGradientIndex:
                  widget.selectedTextBackgroundGradient,
              onToggleTextColorPicker: _toggleTextColor,
              onChangeTextBackground: _onChangeTextBackground,
              activeItem: _activeItem,
              onChangeTextFont: _toggleTextFont,
              isChangeTextFont: _isChangeTextFont,
              isAligntext: _isAligntext,
              isChangeColorText: _isChangeColorText,
              isChangeTextBackground: _isChangeTextBackground,
              align: _selectedTextAlign,
              onChangeTextAlign: () => _switchTextAlign(_selectedTextAlign),
            ),
            TextFieldWidget(
              controller: widget.textEditingController,
              onChanged: _onTextChange,
              onSubmit: _onTextSubmit,
              fontSize: widget.selectedFontSize,
              fontFamilyIndex: widget.selectedFontFamily,
              textColor: widget.selectedTextColor,
              backgroundColorIndex: widget.selectedTextBackgroundGradient,
              textAlign: _selectedTextAlign,
              alignWidget: _selectedAlignWidget,
              textForcus: widget.textFocusNode,
            ),
            if (_isChangeTextFont)
              FontFamilySelectWidget(
                animationsDuration: const Duration(milliseconds: 300),
                pageController: _familyPageController,
                selectedFamilyIndex: widget.selectedFontFamily,
                onPageChanged: _onFamilyChange,
                onTap: (index) {
                  _onStyleChange(index);
                },
              ),
            if (_isChangeColorText)
              TextColorSelectWidget(
                animationsDuration: const Duration(milliseconds: 300),
                pageController: _textColorsPageController,
                selectedTextColor: widget.selectedTextColor,
                onPageChanged: _onTextColorChange,
                onTap: (index) {
                  _onColorChange(index);
                },
              ),
            SizeSliderWidget(
              animationsDuration: const Duration(milliseconds: 300),
              selectedValue: widget.selectedFontSize,
              onChanged: (input) {
                setState(
                  () {
                    widget.selectedFontSize = input;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _toggleTextFont() {
    if (_isChangeColorText) {
      setState(() {
        _isChangeColorText = false;
      });
    }
    setState(() {
      _isChangeTextFont = !_isChangeTextFont;
    });
  }

  void _toggleTextColor() {
    if (_isChangeTextFont) {
      setState(() {
        _isChangeTextFont = false;
      });
    }
    setState(() {
      _isChangeColorText = !_isChangeColorText;
    });
  }

  void _onTextSubmit(String input) {
    if (input.isNotEmpty) {
      setState(
        _onSubmitText,
      );
    } else {
      setState(() {
        _currentText = '';
      });
    }

    setState(
      () {
        _isTextInput = !_isTextInput;
        _activeItem = null;
      },
    );
  }

  void _onChangeTextBackground() {
    setState(() {
      _isChangeTextBackground = true;
    });
    if (widget.selectedTextBackgroundGradient < gradientColors.length - 1) {
      setState(() {
        widget.selectedTextBackgroundGradient++;
      });
    } else {
      setState(() {
        widget.selectedTextBackgroundGradient = 0;
      });
    }
  }

  void _onTextColorChange(index) {
    HapticFeedback.lightImpact();
    setState(
      () {
        widget.selectedTextColor = defaultColors[index];
      },
    );
  }

  void _onFamilyChange(index) {
    HapticFeedback.lightImpact();
    setState(() {
      widget.selectedFontFamily = index;
    });
  }

  void _onTextChange(input) {
    setState(() {
      _currentText = input;
    });
  }

  void _onAddText() {
    setState(() {
      _isTextInput = !_isTextInput;
      _activeItem = null;
    });
    if (_isDrawing) {
      setState(() {
        _isDrawing = false;
      });
    }
    _onSubmitText();
    _familyPageController = PageController(
      initialPage: widget.selectedFontFamily,
      viewportFraction: .125,
    );
    _textColorsPageController = PageController(
      initialPage: defaultColors
          .indexWhere((element) => element == widget.selectedTextColor),
      viewportFraction: .1,
    );
  }

  void _onSubmitText() {
    widget.stackData.add(EditableItem()
      ..type = ItemType.TEXT
      ..value = widget.textEditingController.text
      ..color = widget.selectedTextColor
      ..textStyle = widget.selectedTextBackgroundGradient
      ..fontSize = widget.selectedFontSize
      ..fontFamily = widget.selectedFontFamily
      ..textEditingController = widget.textEditingController
      ..position = widget.position
      ..scale = widget.scale
      ..rotation = widget.rotation);
    widget.onClickDone(widget.stackData);
    // widget.textEditingController.text = '';
    // _currentText = '';
  }

  void _switchTextAlign(TextAlign alignText) {
    switch (alignText) {
      case TextAlign.center:
        setState(() {
          _selectedTextAlign = TextAlign.right;
          _selectedAlignWidget = Alignment.centerRight;
        });
        break;
      case TextAlign.left:
        setState(() {
          _selectedTextAlign = TextAlign.center;
          _selectedAlignWidget = Alignment.center;
        });
        break;
      default:
        setState(() {
          _selectedTextAlign = TextAlign.left;
          _selectedAlignWidget = Alignment.centerLeft;
        });
    }
  }

  void _onStyleChange(int index) {
    HapticFeedback.lightImpact();
    setState(() {
      widget.selectedFontFamily = index;
    });
    _familyPageController.jumpToPage(index);
  }

  void _onColorChange(int index) {
    HapticFeedback.lightImpact();
    setState(() {
      widget.selectedTextColor = defaultColors[index];
    });
    _textColorsPageController.jumpToPage(index);
  }
}
