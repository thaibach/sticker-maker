import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sticker_maker/src/cubit/cubit_index.dart';
import 'package:sticker_maker/src/utils/utils_index.dart';
import 'package:sticker_maker/src/views/edit/components/dialog.dart';
import 'package:sticker_maker/src/views/edit/components/save_edit.dart';
import 'package:sticker_maker/src/views/pack_sticker/page/add_to_pack_page.dart';
import 'package:sticker_maker/src/widgets/custom/buttom_bar/curved_buttom_bar.dart';
import 'package:sticker_maker/src/widgets/widgets_index.dart';

class EditScreen extends StatefulWidget {
  final String? image;

  const EditScreen({super.key, required this.image});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  EditPageCubit editPageCubit = EditPageCubit();
  bool isSave = false;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  bool unSelect = false;
  //Text state
  EditableItem? _activeItem;
  Offset _initPos = const Offset(0, 0);
  Offset _currentPos = const Offset(0, 0);
  double _currentScale = 1;
  double _currentRotation = 0;
  bool _inAction = false;
  bool _isTextInput = false;
  String _currentText = '';
  Color _selectedTextColor = const Color(0xffffffff);
  int _selectedTextBackgroundGradient = 0;
  double _selectedFontSize = 26;
  int _selectedFontFamily = 0;
  bool _isDeletePosition = false;
  bool _isChangeTextFont = false;
  TextAlign _selectedTextAlign = TextAlign.center;
  AlignmentGeometry _selectedAlignWidget = Alignment.center;
  final bool _isAligntext = false;
  bool _isChangeColorText = false;
  bool _isChangeTextBackground = false;
  late PageController _familyPageController;
  late PageController _textColorsPageController;
  late PageController _gradientsPageController;
  final _editingController = TextEditingController();
  final _stackData = <EditableItem>[];
  //Drawing state
  bool _isDrawing = false;
  double _paintStroke = 20;
  late PainterController _drawingController;
  ui.Image? drawingImage;
  Paint shapePaint = Paint()
    ..strokeWidth = 10
    ..color = Colors.blue
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;
  FocusNode textFocusNode = FocusNode();
  Color _brushColor = brushColors[0];
  @override
  void initState() {
    _initText();
    _initDrawing();
    super.initState();
  }

  @override
  void dispose() {
    _editingController.dispose();
    _familyPageController.dispose();
    _textColorsPageController.dispose();
    _gradientsPageController.dispose();
    textFocusNode.dispose();
    super.dispose();
  }

  void _initText() {
    _stackData.add(
      EditableItem()
        ..type = ItemType.IMAGE
        ..value = widget.image!,
    );
    _familyPageController = PageController(viewportFraction: .125);
    _textColorsPageController = PageController(viewportFraction: .1);
    _gradientsPageController = PageController(viewportFraction: .175);
  }

  void _initDrawing() async {
    _drawingController = PainterController(
        settings: PainterSettings(
            freeStyle: const FreeStyleSettings(
              color: Colors.black,
              strokeWidth: 10,
            ),
            shape: ShapeSettings(
              paint: shapePaint,
            ),
            scale: const ScaleSettings(
              enabled: true,
              minScale: 1,
              maxScale: 5,
            )));
    final image = await FileImage(File(widget.image!)).image;

    setState(() {
      drawingImage = image;
      _drawingController.background = image.backgroundDrawable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditPageCubit, EditPageState>(
      bloc: editPageCubit,
      listener: (context, state) {
        // TODO: implement listener
        if (state is EditPageSuccess) {
          AppNavigate.navigatePage(
              context,
              AddToPackPage(
                imageFile: state.image,
              ));
        }
      },
      builder: (context, state) {
        return DefaultTextHeightBehavior(
          textHeightBehavior: const TextHeightBehavior(
            leadingDistribution: TextLeadingDistribution.even,
          ),
          child: Scaffold(
            backgroundColor: const Color(0xFFCECECE),
            resizeToAvoidBottomInset: false,
            body: Stack(
              clipBehavior: Clip.antiAlias,
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.89,
                    margin: const EdgeInsets.only(top: 30, right: 10, left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                               // AppNavigate.pop(context);
                                ComponentsDialog().diaLogBackEdit(context);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 10, left: 10),
                                height: 50,
                                width: 50,
                                child: Container(
                                  margin: const EdgeInsets.all(1),
                                  decoration:
                                      BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                                  child: Center(
                                    child: SvgPicture.asset('assets/icons/ic_back.svg'),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            const SizedBox(),
                            const Spacer(),
                            GestureDetector(
                              onTap: () async {
                                Loading.show(context, 'notiMess');
                                setState(() {
                                  isSave = true;
                                });
                                Uint8List? imageData = await SaveViewImage.saveAsUint8List(ImageQuality.high);
                                if (imageData != null) {
                                  editPageCubit.saveImage(imageData, '${DateTime.now().microsecondsSinceEpoch}');
                                }
                                Loading.hide(context);
                                if (isSave) {
                                  setState(() {
                                    isSave = false;
                                  });
                                }
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 10, right: 10),
                                height: 50,
                                width: 50,
                                child: Center(
                                  child: SvgPicture.asset('assets/icons/ic_tick.svg'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          child: Stack(clipBehavior: Clip.antiAlias, children: [
                            GestureDetector(
                              onScaleStart: _onScaleStart,
                              onScaleUpdate: _onScaleUpdate,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    child: SaveViewImage(
                                      child: Stack(
                                        children: [
                                          if (widget.image != null && drawingImage != null)
                                            Container(
                                              margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                                              padding: const EdgeInsets.all(20),
                                              decoration: !isSave
                                                  ? const BoxDecoration(
                                                      // color: Colors.blue,
                                                      image: DecorationImage(
                                                        image: AssetImage('assets/images/img_transparent_bgr.png'),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )
                                                  : null,
                                              height: MediaQuery.of(context).size.height * 0.67,
                                              width: double.infinity,
                                              child: Center(
                                                child: AspectRatio(
                                                    aspectRatio: drawingImage!.width / drawingImage!.height,
                                                    child: FlutterPainter(
                                                      controller: _drawingController,
                                                    )),
                                              ),
                                            ),
                                          ..._stackData
                                              .map(
                                                (editableItem) => OverlayItemWidget(
                                                  editableItem: editableItem,
                                                  onItemTap: () {
                                                    _onOverlayItemTap(editableItem);
                                                  },
                                                  onPointerDown: (details) {
                                                    _onOverlayItemPointerDown(
                                                      editableItem,
                                                      details,
                                                    );
                                                  },
                                                  onPointerUp: (details) {
                                                    _onOverlayItemPointerUp(
                                                      editableItem,
                                                      details,
                                                    );
                                                  },
                                                  onPointerMove: (details) {
                                                    _onOverlayItemPointerMove(
                                                      editableItem,
                                                      details,
                                                    );
                                                  },
                                                ),
                                              )
                                              .toList(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            RemoveWidget(
                              isTextInput: _isTextInput,
                              animationsDuration: const Duration(milliseconds: 300),
                              activeItem: _activeItem,
                              isDeletePosition: _isDeletePosition,
                            ),
                          ]),
                        ),
                        if (_isDrawing) Padding(padding: const EdgeInsets.only(top: 8.0), child: _drawingSection()),
                      ],
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 60 + MediaQuery.of(context).padding.bottom),
                    child: CurvedNavigationBar(
                      click: (value) {
                        unSelect = value;
                      },
                      unSelect: unSelect,
                      key: _bottomNavigationKey,
                      index: 0,
                      height: 60.0,
                      width: AppValue.widths * 0.85,
                      items: const <String>[
                        'assets/icons/add_text.svg',
                        'assets/icons/Brush.svg',
                        'assets/icons/emoji.svg',
                        'assets/icons/object.svg',
                      ],
                      color: Colors.redAccent,
                      buttonBackgroundColor: Colors.yellowAccent,
                      backgroundColor: Colors.transparent,
                      animationCurve: Curves.linearToEaseOut,
                      animationDuration: const Duration(milliseconds: 300),
                      onTap: (index) {
                        setState(() {
                          if (unSelect = true) {
                            if (index == 0) {
                              _onAddText();
                            } else if (index == 1) {
                              _toggleDrawing();
                            } else if (index == 2) {
                              print("crop");
                            }
                          }
                        });
                      },
                      letIndexChange: (index) => true,
                    ),
                  ),
                ),
                if (_isTextInput)
                  Positioned.fill(
                      child: Container(
                          height: context.height,
                          width: context.width,
                          color: Colors.black.withOpacity(0.4),
                          child: _addTextOverlay()))
              ],
            ),
          ),
        );
      },
    );
  }

/*
Add Text function, will improve to bloc in future
current is missing memorized text widget position when edit text
Viet
*/
  _addTextOverlay() {
    return Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        TopToolsWidget(
          // onCancel: _onCancel,
          onDone: _onAddText,
          isTextInput: _isTextInput,
          animationsDuration: const Duration(milliseconds: 300),
          selectedTextBackgroundGradientIndex: _selectedTextBackgroundGradient,
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
          controller: _editingController,
          onChanged: _onTextChange,
          onSubmit: _onTextSubmit,
          fontSize: _selectedFontSize,
          fontFamilyIndex: _selectedFontFamily,
          textColor: _selectedTextColor,
          backgroundColorIndex: _selectedTextBackgroundGradient,
          textAlign: _selectedTextAlign,
          alignWidget: _selectedAlignWidget,
          textForcus: textFocusNode,
        ),
        if (_isChangeTextFont)
          FontFamilySelectWidget(
            animationsDuration: const Duration(milliseconds: 300),
            pageController: _familyPageController,
            selectedFamilyIndex: _selectedFontFamily,
            onPageChanged: _onFamilyChange,
            onTap: (index) {
              _onStyleChange(index);
            },
          ),
        if (_isChangeColorText)
          TextColorSelectWidget(
            animationsDuration: const Duration(milliseconds: 300),
            pageController: _textColorsPageController,
            selectedTextColor: _selectedTextColor,
            onPageChanged: _onTextColorChange,
            onTap: (index) {
              _onColorChange(index);
            },
          ),
        SizeSliderWidget(
          animationsDuration: const Duration(milliseconds: 300),
          selectedValue: _selectedFontSize,
          onChanged: (input) {
            setState(
              () {
                _selectedFontSize = input;
              },
            );
          },
        ),
      ],
    );
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

  void _onTextChange(input) {
    setState(() {
      _currentText = input;
    });
  }

  void _onChangeTextBackground() {
    setState(() {
      _isChangeTextBackground = true;
    });
    if (_selectedTextBackgroundGradient < gradientColors.length - 1) {
      setState(() {
        _selectedTextBackgroundGradient++;
      });
    } else {
      setState(() {
        _selectedTextBackgroundGradient = 0;
      });
    }
  }

  void _onTextColorChange(index) {
    HapticFeedback.lightImpact();
    setState(
      () {
        _selectedTextColor = defaultColors[index];
      },
    );
  }

  void _onFamilyChange(index) {
    HapticFeedback.lightImpact();
    setState(() {
      _selectedFontFamily = index;
    });
  }

  void _onScaleStart(ScaleStartDetails details) {
    if (_activeItem == null) {
      return;
    }
    _initPos = details.focalPoint;
    _currentPos = _activeItem!.position;
    _currentScale = _activeItem!.scale;
    _currentRotation = _activeItem!.rotation;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    if (_activeItem == null) {
      return;
    }
    final delta = details.focalPoint - _initPos;
    final left = (delta.dx / context.width) + _currentPos.dx;
    final top = (delta.dy / context.height) + _currentPos.dy;

    setState(() {
      _activeItem!.position = Offset(left, top);
      _activeItem!.rotation = details.rotation + _currentRotation;
      _activeItem!.scale = details.scale * _currentScale;
    });
  }

  void _onAddText() {
    textFocusNode.requestFocus();
    setState(() {
      _isTextInput = !_isTextInput;
      _activeItem = null;
    });
    if (_isDrawing) {
      setState(() {
        _isDrawing = false;
      });
    }
    if (_currentText.isNotEmpty) {
      _onSubmitText();
    }
    _familyPageController = PageController(
      initialPage: _selectedFontFamily,
      viewportFraction: .125,
    );
    _textColorsPageController = PageController(
      initialPage: defaultColors.indexWhere((element) => element == _selectedTextColor),
      viewportFraction: .1,
    );
    // AppNavigate.pop(context);
  }

  void _onSubmitText() {
    _stackData.add(EditableItem()
      ..type = ItemType.TEXT
      ..value = _currentText
      ..color = _selectedTextColor
      ..textStyle = _selectedTextBackgroundGradient
      ..fontSize = _selectedFontSize
      ..fontFamily = _selectedFontFamily);
    _editingController.text = '';
    _currentText = '';
  }

  void _onStyleChange(int index) {
    HapticFeedback.lightImpact();
    setState(() {
      _selectedFontFamily = index;
    });
    _familyPageController.jumpToPage(index);
  }

  void _onColorChange(int index) {
    HapticFeedback.lightImpact();
    setState(() {
      _selectedTextColor = defaultColors[index];
    });
    _textColorsPageController.jumpToPage(index);
  }

  void _onOverlayItemTap(EditableItem e) {
    textFocusNode.requestFocus();
    setState(
      () {
        _isTextInput = !_isTextInput;
        _activeItem = null;
        _editingController.text = e.value;
        _currentText = e.value;
        _selectedFontFamily = e.fontFamily;
        _selectedFontSize = e.fontSize;
        _selectedTextBackgroundGradient = e.textStyle;
        _selectedTextColor = e.color;
        _stackData.removeAt(_stackData.indexOf(e));
      },
    );
    _familyPageController = PageController(
      initialPage: e.textStyle,
      viewportFraction: .1,
    );
    _textColorsPageController = PageController(
      initialPage: defaultColors.indexWhere(
        (element) => element == e.color,
      ),
      viewportFraction: .1,
    );
  }

  void _onOverlayItemPointerDown(EditableItem e, PointerDownEvent details) {
    if (e.type != ItemType.IMAGE) {
      if (_inAction) {
        return;
      }
      _inAction = true;
      _activeItem = e;
      _initPos = details.position;
      _currentPos = e.position;
      _currentScale = e.scale;
      _currentRotation = e.rotation;
    }
  }

  void _onOverlayItemPointerUp(EditableItem e, PointerUpEvent details) {
    _inAction = false;
    if (e.position.dy >= 0.65 && e.position.dx >= 0.0 && e.position.dx <= 1.0) {
      setState(() {
        _stackData.removeAt(_stackData.indexOf(e));
        _activeItem = null;
      });
    }

    setState(() {
      _activeItem = null;
    });
  }

  void _onOverlayItemPointerMove(EditableItem e, PointerMoveEvent details) {
    if (e.position.dy >= 0.65 && e.position.dx >= 0.0 && e.position.dx <= 1.0) {
      setState(() {
        _isDeletePosition = true;
      });
    } else {
      setState(() {
        _isDeletePosition = false;
      });
    }
  }

  /*void _onCancel() {
    setState(() {
      _isTextInput = false;
      _activeItem = null;
    });
  }*/
  /// **************************************************************************
//Drawing function
  _drawingSection() {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SvgPicture.asset('assets/icons/Size.svg'),
          AppSlider(
              onChanged: (v) {
                setState(() {
                  _paintStroke = v;
                });
                _drawingController.freeStyleStrokeWidth = _paintStroke;
              },
              sliderValue: _paintStroke),
          GestureDetector(
            onTap: () => _drawingController.canUndo ? _undo() : null,
            child: SvgPicture.asset('assets/icons/ic_undo.svg'),
          ),
          GestureDetector(
            onTap: () => _drawingController.canRedo ? _redo() : null,
            child: SvgPicture.asset('assets/icons/ic_redo.svg'),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.only(left: 4.0, right: 4),
          child: SizedBox(
              child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 6,
              children: brushColors.map(
                (color) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _brushColor = color;
                      });
                      _drawingController.freeStyleColor = color;
                    },
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: color,
                          border: Border.all(color: _brushColor == color ? Colors.red : Colors.black)),
                      child: const SizedBox.shrink(),
                    ),
                  );
                },
              ).toList(),
            ),
          )),
        ),
      ],
    );
  }

  void _redo() {
    _drawingController.redo();
  }

  void _undo() {
    _drawingController.undo();
  }

  void _toggleDrawing() {
    setState(() {
      _isDrawing = true;
    });
    _drawingController.freeStyleMode = _isDrawing ? FreeStyleMode.draw : FreeStyleMode.none;
  }
}
