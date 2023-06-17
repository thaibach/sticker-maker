// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sticker_maker/src/views/edit/components/dialog.dart';
import 'package:sticker_maker/src/views/pack_sticker/cubit/add_sticker_to_pack_cubit.dart';
import 'package:sticker_maker/src/views/pack_sticker/page/add_to_pack_page.dart';
import 'package:sticker_maker/src/views/edit/components/add_drawing.dart';
import 'package:sticker_maker/src/views/edit/components/add_sticker.dart';
import 'package:sticker_maker/src/views/edit/components/add_text_overlay.dart';

import '../../cubit/cubit_index.dart';
import '../../utils/utils_index.dart';
import '../../widgets/custom/buttom_bar/curved_buttom_bar.dart';
import '../../widgets/widgets_index.dart';
import '../views_index.dart';
import 'components/add_emoji.dart';
import 'components/save_edit.dart';

class EditStickerPage extends StatefulWidget {
  final String imagePath;
  const EditStickerPage({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<EditStickerPage> createState() => _EditStickerPageState();
}

class _EditStickerPageState extends State<EditStickerPage> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int indexSelect = -1;
  bool unSelect = false;

  EditableItem? _activeItem;
  Offset _initPos = const Offset(0, 0);
  Offset _currentPos = const Offset(0, 0);
  double _currentScale = 1;
  double _currentRotation = 0;

  late PainterController _drawingController;
  late PainterController _drawingControllers;

  ui.Image? drawingImage;
  Paint shapePaint = Paint()
    ..strokeWidth = 10
    ..color = Colors.blue
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

  FocusNode textFocusNode = FocusNode();

  EditPageCubit editPageCubit = EditPageCubit();
  bool _isDeletePosition = false;
  late PageController familyPageController;
  late PageController textColorsPageController;
  late PageController gradientsPageController;
  TextEditingController editingController = TextEditingController();
  int selectedFontFamily = 0;
  double selectedFontSize = 26;
  Color selectedTextColor = const Color(0xff000000);
  int selectedTextBackgroundGradient = 0;
  // bool _isTextInput = false;

  @override
  void initState() {
    editPageCubit.stackData.add(
      EditableItem()
        ..type = ItemType.IMAGE
        ..value = widget.imagePath,
    );
    familyPageController = PageController(viewportFraction: .125);
    textColorsPageController = PageController(viewportFraction: .1);
    gradientsPageController = PageController(viewportFraction: .175);
    _initDrawing();
    super.initState();
  }

  @override
  void dispose() {
    textFocusNode.dispose();
    super.dispose();
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
              enabled: false,
              minScale: 1,
              maxScale: 10,
            )),
    );
    _drawingControllers = PainterController(
      settings: PainterSettings(
          freeStyle: const FreeStyleSettings(
            color: Colors.black,
            strokeWidth: 10,
          ),
          shape: ShapeSettings(
            paint: shapePaint,
          ),
          scale: const ScaleSettings(
            enabled: false,
            minScale: 1,
            maxScale: 10,
          )),
    );
    final image = await FileImage(File(widget.imagePath)).image;
    final images = await const NetworkImage('https://picsum.photos/1920/1080/').image;
    setState(() {
      drawingImage = image;
      drawingImage = images;
      _drawingController.background = image.backgroundDrawable;
      _drawingControllers.background = images.backgroundDrawable;
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
              BlocProvider(
                create: (context) => AddStickerToPackCubit()..readData(),
                child: AddToPackPage(
                  imageFile: state.image,
                ),
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
                    margin: EdgeInsets.only(
                        top: MediaQueryData.fromWindow(window).viewPadding.top + 5,
                        right: 10,
                        left: 10,
                        bottom: AppValue.heights * 0.06 + MediaQuery.of(context).padding.bottom),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                ComponentsDialog().diaLogBackEdit(context);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 10, left: 10),
                                height: 50,
                                width: 50,
                                child: Container(
                                  margin: const EdgeInsets.all(1),
                                  color: Colors.white,
                                  child: Center(
                                    child: SvgPicture.asset('assets/icons/ic_back.svg'),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                Loading.show(context, 'notiMess');
                                Uint8List? imageData = await SaveViewImage.saveAsUint8List(ImageQuality.high);
                                if (imageData != null) {
                                  editPageCubit.saveImage(imageData, '${DateTime.now().microsecondsSinceEpoch}.png');
                                }
                                Loading.hide(context);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 10, right: 10),
                                height: 50,
                                width: 50,
                                child: Center(
                                  child: GestureDetector(
                                    onTap: null,
                                    child: SvgPicture.asset('assets/icons/icon_save.svg'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Stack(clipBehavior: Clip.antiAlias, children: [
                              GestureDetector(
                                onScaleStart: _onScaleStart,
                                onScaleUpdate: _onScaleUpdate,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.height * 0.65,
                                      width: double.infinity,
                                     // margin: const EdgeInsets.symmetric(horizontal: 8),
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/img_transparent_bgr.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      child: SaveViewImage(
                                        child: Stack(
                                          children: [
                                            if (widget.imagePath != null && drawingImage != null)
                                              // Container(
                                              //   //   margin: const EdgeInsets.only(left: 8, right: 8),
                                              //   height: MediaQuery.of(context).size.height * 0.65,
                                              //   width: double.infinity,
                                              //   child: Center(
                                              //     child: FlutterPainter(
                                              //       onDrawableCreated: (a) {
                                              //         setState(() {});
                                              //       },
                                              //       controller: _drawingControllers,
                                              //     ),
                                              //   ),
                                              // ),
                                              Container(
                                               margin: const EdgeInsets.only(left: 8, right: 8,),
                                                height: MediaQuery.of(context).size.height * 0.65,
                                                width: double.infinity,
                                                child: Center(
                                                  child: FlutterPainter(
                                                    onDrawableCreated: (a) {
                                                      setState(() {});
                                                    },
                                                    controller: _drawingController,
                                                  ),
                                                ),
                                              ),
                                            RemoveWidget(
                                              isTextInput: false,
                                              animationsDuration: const Duration(milliseconds: 300),
                                              activeItem: _activeItem,
                                              isDeletePosition: _isDeletePosition,
                                            ),
                                            Container(
                                              margin: const EdgeInsets.symmetric(horizontal: 8),
                                              height: MediaQuery.of(context).size.height * 0.65,
                                              width: double.infinity,
                                              child: Stack(
                                                  children: List.generate(
                                                      editPageCubit.stackData.length,
                                                      (index) => OverlayItemWidget(
                                                            editableItem: editPageCubit.stackData[index],
                                                            onItemTap: () {
                                                              _onOverlayItemTap(editPageCubit.stackData[index]);
                                                            },
                                                            onPointerDown: (details) {
                                                              _onOverlayItemPointerDown(
                                                                editPageCubit.stackData[index],
                                                                details,
                                                              );
                                                            },
                                                            onPointerUp: (details) {
                                                              _onOverlayItemPointerUp(
                                                                  editPageCubit.stackData[index], details, index);
                                                            },
                                                            onPointerMove: (details) {
                                                              _onOverlayItemPointerMove(
                                                                editPageCubit.stackData[index],
                                                                details,
                                                              );
                                                            },
                                                          ))),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (indexSelect == 2)
                                      AddEmojiWidget(
                                        stackData: editPageCubit.stackData,
                                        update: (value) {
                                          setState(() {
                                            editPageCubit.stackData = value;
                                            unSelect = false;
                                            indexSelect = -1;
                                          });
                                        },
                                        pop: () {
                                          setState(() {
                                            unSelect = false;
                                            indexSelect = -1;
                                          });
                                        },
                                      ),
                                    if (indexSelect == 3)
                                      AddStickerWidget(
                                        stackData: editPageCubit.stackData,
                                        update: (value) {
                                          setState(() {
                                            editPageCubit.stackData = value;
                                            unSelect = false;
                                            indexSelect = -1;
                                          });
                                        },
                                        pop: () {
                                          setState(() {
                                            unSelect = false;
                                            indexSelect = -1;
                                          });
                                        },
                                      ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ),
                        if (indexSelect == 1)
                          Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: AppValue.heights * 0.07),
                              child: AddDrawing(
                                drawingController: _drawingController,
                                undo: () {
                                  _drawingController.undo();
                                  setState(() {});
                                },
                                redo: () {
                                  _drawingController.redo();
                                  setState(() {});
                                },
                              )),
                      ],
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: AppValue.heights * 0.06 + MediaQuery.of(context).padding.bottom),
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
                          // if (unSelect = true) {
                          indexSelect = index;
                          if (indexSelect == 0) {
                            showDialogAddText(context);
                            _drawingController.freeStyleMode = FreeStyleMode.none;
                          } else if (indexSelect == 1) {
                            _drawingController.freeStyleMode = FreeStyleMode.draw;
                          } else if (indexSelect == 2) {
                            _drawingController.freeStyleMode = FreeStyleMode.none;
                          } else if (indexSelect == 3) {
                            _drawingController.freeStyleMode = FreeStyleMode.none;
                          }
                          // }
                        });
                      },
                      letIndexChange: (index) => true,
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

  Future<dynamic> showDialogAddText(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AddTextOverlay(
            onClickDone: (value) {
              editPageCubit.stackData = value;
              setState(() {
                unSelect = false;
              });
              Navigator.pop(context);
            },
            stackData: editPageCubit.stackData,
            textFocusNode: textFocusNode,
            textEditingController: TextEditingController(),
            selectedFontFamily: 0,
            selectedFontSize: 26,
            selectedTextColor: const Color(0xff000000),
            selectedTextBackgroundGradient: 0,
            position: const Offset(0.1, 0.4),
            scale: 1,
            rotation: 0,
          );
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

  void _onOverlayItemTap(EditableItem e) {
    EditableItem editE = e;
    editPageCubit.stackData.removeAt(editPageCubit.stackData.indexOf(e));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AddTextOverlay(
            onClickDone: (value) {
              editPageCubit.stackData = value;
              setState(() {
                unSelect = false;
              });
              Navigator.pop(context);
            },
            stackData: editPageCubit.stackData,
            textFocusNode: textFocusNode,
            textEditingController: editE.textEditingController,
            selectedFontFamily: editE.fontFamily,
            selectedFontSize: editE.fontSize,
            selectedTextColor: editE.color,
            selectedTextBackgroundGradient: editE.textStyle,
            position: editE.position,
            scale: editE.scale,
            rotation: editE.rotation,
          );
        });
    familyPageController = PageController(
      initialPage: editE.textStyle,
      viewportFraction: .1,
    );
    textColorsPageController = PageController(
      initialPage: defaultColors.indexWhere(
        (element) => element == editE.color,
      ),
      viewportFraction: .1,
    );
  }

  void _onOverlayItemPointerDown(EditableItem e, PointerDownEvent details) {
    // if (e.type != ItemType.IMAGE) {
    _activeItem = e;
    _initPos = details.position;
    _currentPos = e.position;
    _currentScale = e.scale;
    _currentRotation = e.rotation;
    // }
  }

  void _onOverlayItemPointerUp(EditableItem e, PointerUpEvent details, int index) {
    setState(() {
      if (_activeItem != null) {
        editPageCubit.stackData[index] = _activeItem!;
        if (e.position.dy >= 0.57 && e.position.dx >= -0.2 && e.position.dx <= 0.2) {
          editPageCubit.stackData.removeAt(editPageCubit.stackData.indexOf(e));
          _activeItem = null;
        } else {
          _activeItem = null;
        }
      }
    });
  }

  void _onOverlayItemPointerMove(EditableItem e, PointerMoveEvent details) {
    setState(() {
      if (e.position.dy >= 0.57 && e.position.dx >= -0.2 && e.position.dx <= 0.2) {
        _isDeletePosition = true;
      } else {
        _isDeletePosition = false;
      }
    });
  }
}
