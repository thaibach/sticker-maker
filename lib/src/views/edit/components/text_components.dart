/*
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sticker_maker/src/cubit/cubit_index.dart';
import 'package:sticker_maker/src/utils/utils_index.dart';
import 'package:sticker_maker/src/widgets/widgets_index.dart';

class EditScreen extends StatefulWidget {
  final String? image;
  const EditScreen({super.key, required this.image});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  EditPageCubit editPageCubit = EditPageCubit();
  GlobalKey previewContainer = GlobalKey();
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
  bool _isColorPickerSelected = false;
  bool _isChangeTextFont = false;

  final bool _isAligntext = false;
  final bool _isChangeColorText = false;
  final bool _isChangeTextBackground = false;
  late PageController _familyPageController;
  late PageController _textColorsPageController;
  late PageController _gradientsPageController;
  final _editingController = TextEditingController();
  final _stackData = <EditableItem>[];
  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _editingController.dispose();
    _familyPageController.dispose();
    _textColorsPageController.dispose();
    _gradientsPageController.dispose();
    super.dispose();
  }

  void _init() {
    _stackData.add(
      EditableItem()
        ..type = ItemType.IMAGE
        ..value = widget.image!,
    );
    _familyPageController = PageController(viewportFraction: .125);
    _textColorsPageController = PageController(viewportFraction: .1);
    _gradientsPageController = PageController(viewportFraction: .175);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditPageCubit, EditPageState>(
      bloc: editPageCubit,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFFCECECE),
          resizeToAvoidBottomInset: true,
          body: DefaultTextHeightBehavior(
            textHeightBehavior: const TextHeightBehavior(
              leadingDistribution: TextLeadingDistribution.even,
            ),
            child: Stack(
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
                                AppNavigate.pop(context);
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.only(top: 10, left: 10),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFDE225B),
                                      Color(0xFFE46D39),
                                    ],
                                  ),
                                ),
                                child: Container(
                                  margin: const EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white),
                                  child: Center(
                                    child: SvgPicture.asset(
                                        'assets/icons/ic_back.svg'),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            const SizedBox(),
                            const Spacer(),
                            Container(
                              margin: const EdgeInsets.only(top: 10, right: 10),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color(0xFF36CF00)),
                              child: Container(
                                margin: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: null,
                                    child: SvgPicture.asset(
                                        'assets/icons/ic_tick.svg'),
                                  ),
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
                                    child: Stack(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 10, right: 10, top: 10),
                                          padding: const EdgeInsets.all(20),
                                          decoration: const BoxDecoration(
                                            // color: Colors.blue,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/img_transparent_bgr.png'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.67,
                                          width: double.infinity,
                                          child: Center(
                                            child:
                                                Image.file(File(widget.image!)),
                                          ),
                                        ),
                                        ..._stackData
                                            .map(
                                              (editableItem) =>
                                                  OverlayItemWidget(
                                                editableItem: editableItem,
                                                onItemTap: () {
                                                  _onOverlayItemTap(
                                                      editableItem);
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
                                ],
                              ),
                            ),
                            RemoveWidget(
                              isTextInput: _isTextInput,
                              animationsDuration:
                                  const Duration(milliseconds: 300),
                              activeItem: _activeItem,
                              isDeletePosition: _isDeletePosition,
                            ),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(children: [
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: GestureDetector(
                                child: SvgPicture.asset(
                                    'assets/icons/ic_undo.svg'),
                              ),
                            ),
                            GestureDetector(
                              child:
                                  SvgPicture.asset('assets/icons/ic_redo.svg'),
                            ),
                          ]),
                        ),
                      ],
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 50),
                    width: double.infinity,
                    height: 42,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: const LinearGradient(colors: [
                          Color(0xFFDE225B),
                          Color(0xFFE46D39),
                        ])),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => _addTextDialog(context),
                          icon: const Icon(
                            Icons.smart_display,
                            color: Colors.white,
                          ),
                          color: Colors.white,
                        ),
                        const IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.dangerous,
                            color: Colors.white,
                          ),
                          color: Colors.white,
                        ),
                        const IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.face,
                            color: Colors.white,
                          ),
                          color: Colors.white,
                        ),
                        const IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.g_translate,
                            color: Colors.white,
                          ),
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _addTextDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) => Dialog.fullscreen(
            backgroundColor: Colors.transparent,
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                TopToolsWidget(
                  onCancel: _onCancel,
                  onDone: _onDone,
                  isTextInput: _isTextInput,
                  animationsDuration: const Duration(milliseconds: 300),
                  onScreenTap: _onDone,
                  selectedTextBackgroundGradientIndex:
                      _selectedTextBackgroundGradient,
                  onToggleTextColorPicker: _onToggleTextColorSelector,
                  onChangeTextBackground: _onChangeTextBackground,
                  activeItem: _activeItem,
                  onChangeTextFont: () => setState(() {
                    _isChangeTextFont = !_isChangeTextFont;
                  }),
                  isChangeTextFont: _isChangeTextFont,
                  isAligntext: _isAligntext,
                  isChangeColorText: _isChangeColorText,
                  isChangeTextBackground: _isChangeTextBackground,
                ),
                TextFieldWidget(
                  controller: _editingController,
                  onChanged: _onTextChange,
                  onSubmit: _onTextSubmit,
                  fontSize: _selectedFontSize,
                  fontFamilyIndex: _selectedFontFamily,
                  textColor: _selectedTextColor,
                  backgroundColorIndex: _selectedTextBackgroundGradient,
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
            )));
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

  void _onToggleTextColorSelector() {
    setState(
      () {
        _isColorPickerSelected = !_isColorPickerSelected;
      },
    );
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

  void _onDone() {
    setState(() {
      _isTextInput = !_isTextInput;
      _activeItem = null;
    });

    if (_currentText.isNotEmpty) {
      setState(_onSubmitText);
    }
    _familyPageController = PageController(
      initialPage: _selectedFontFamily,
      viewportFraction: .125,
    );
    _textColorsPageController = PageController(
      initialPage:
          defaultColors.indexWhere((element) => element == _selectedTextColor),
      viewportFraction: .1,
    );
    AppNavigate.pop(context);
  }

  void _onSubmitText() {
    _stackData.add(
      EditableItem()
        ..type = ItemType.TEXT
        ..value = _currentText
        ..color = _selectedTextColor
        ..textStyle = _selectedTextBackgroundGradient
        ..fontSize = _selectedFontSize
        ..fontFamily = _selectedFontFamily,
    );
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
    _addTextDialog(context);
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

  void _onCancel() {
    AppNavigate.pop(context);
  }
}
*/
