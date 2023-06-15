import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Uint8List;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sticker_maker/src/cubit/cubit_index.dart';
import 'package:sticker_maker/src/utils/utils_index.dart';
import 'package:sticker_maker/src/views/views_index.dart';
import 'package:sticker_maker/src/widgets/custom/crop_your_image.dart';
import 'package:sticker_maker/src/widgets/widgets_index.dart';

import '../../widgets/custom/buttom_bar/curved_buttom_bar.dart';

class PreEditPage extends StatefulWidget {
  final File? image;
  bool loading;

  PreEditPage({
    Key? key,
    required this.image,
    required this.loading,
  }) : super(key: key);

  @override
  State<PreEditPage> createState() => _PreEditPageState();
}

class _PreEditPageState extends State<PreEditPage> {
  String functionLabel = '';
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  bool unSelect = false;
  PreEditCubit preEditCubit = PreEditCubit();
  final cropController = CropController();
  List<String> lable = ["Remove background", "Manual crop", "Frame crop"];

  @override
  void initState() {
    preEditCubit.turnOffBorder = false;
    Future.delayed(const Duration(seconds: 0), () {
      Loading.show(context, "");
      Future.delayed(const Duration(seconds: 1), () {
        loadImageBytes();
        Loading.hide(context);
      });
    });
    super.initState();
  }

  void loadImageBytes() async {
    try {
      File imagefile = File(widget.image!.path); //convert Path to File
      Uint8List imagebytes = await imagefile.readAsBytes();
      //convert to bytes
      String base64string = base64.encode(imagebytes);
      //convert bytes to base64 string
      print(base64string);
      Uint8List decodedbytes = base64.decode(base64string);
      setState(() {
        preEditCubit.croppedData = Uint8List.fromList(decodedbytes);
      });
    } catch (e) {
      print('Error reading image file: $e');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PreEditCubit, PreEditState>(
      bloc: preEditCubit,
      listener: (context, state) {
        if (state is RemoveBGLoading) {
          Loading.show(context, '');
        }
        if (state is RemoveBGSuccess) {
          Loading.hide(context);
          AppNavigate.navigatePage(
              context, EditStickerPage(imagePath: state.imagePath));
        }
        if (state is CropEditSuccess) {
          AppNavigate.navigatePage(
              context,
              EditStickerPage(
                imagePath: state.path,
              ));
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: Scaffold(
            backgroundColor: const Color(0xFFCECECE),
            body: Stack(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 5,
                        right: 10,
                        left: 10,
                        bottom: MediaQuery.of(context).padding.bottom +
                            Get.height * 0.06),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 0,
                          blurRadius: 2,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                AppNavigate.replacePage(
                                    context, const HomePage());
                              },
                              child: Container(
                                height: 50,
                                width: 75,
                                padding: const EdgeInsets.all(16),
                                color: Colors.transparent,
                                child: SvgPicture.asset(
                                    'assets/icons/ic_back_home.svg'),
                              ),
                            ),
                            Text(
                              functionLabel,
                              style: AppStyle.DEFAULT_16.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  preEditCubit.isCropping = true;
                                });
                                preEditCubit.isCircleUi
                                    ? cropController.cropCircle()
                                    : cropController.crop();
                              },
                              child: Container(
                                  height: 50,
                                  width: 70,
                                  padding: const EdgeInsets.all(16),
                                  color: Colors.transparent,
                                  child: SvgPicture.asset(
                                      'assets/icons/ic_call_edit.svg')),
                            ),
                          ],
                        ),
                        Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.66,
                            margin: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/img_transparent_bgr.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  color: preEditCubit.turnOffBorder == true
                                      ? Colors.black.withOpacity(0.64)
                                      : Colors.transparent,
                                  padding: const EdgeInsets.all(22),
                                  child: Container(
                                    color: Colors.white.withOpacity(0.16),
                                  ),
                                ),
                                preEditCubit.croppedData != null
                                    ? Visibility(
                                        visible:
                                            preEditCubit.croppedData != null,
                                        replacement:
                                            preEditCubit.croppedData != null
                                                ? SizedBox(
                                                    height: double.infinity,
                                                    width: double.infinity,
                                                    child: Image.memory(
                                                      preEditCubit.croppedData!,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  )
                                                : const SizedBox.shrink(),
                                        child: Padding(
                                          padding: EdgeInsets.all(22),
                                          child: Crop(
                                            controller: cropController,
                                            image: preEditCubit.croppedData!,
                                            onCropped: (croppedDatas) {
                                              setState(() {
                                                preEditCubit.croppedData =
                                                    croppedDatas;
                                                preEditCubit.isCropping = false;
                                              });
                                            },
                                            //  interactive: false,
                                            initialSize: 0.90,
                                            preEditCubit: preEditCubit,
                                            radius: 5,
                                            onStatusChanged: (status) =>
                                                setState(() {}),
                                            maskColor: preEditCubit.isSumbnail
                                                ? Colors.white
                                                : null,
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              ],
                            )),
                        preEditCubit.cropper == true
                            ? Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            preEditCubit.isCircleUi = false;
                                            cropController
                                              ..withCircleUi = false
                                              ..aspectRatio = 1;
                                            setState(() {
                                              preEditCubit.turnOffBorder = true;
                                            });
                                          },
                                          child: Container(
                                            height: 50,
                                            color: Colors.transparent,
                                            child: Column(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/icons/ic_rectangle.svg'),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  AppLocalizations.of(context)!
                                                      .rectangle,
                                                  style: AppStyle
                                                      .DEFAUlT_CONTENT.copyWith(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12,
                                                    color:
                                                        const Color(0xFF2F2CCC),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            preEditCubit.isCircleUi = true;
                                            cropController.withCircleUi = true;
                                            setState(() {
                                              preEditCubit.turnOffBorder = true;
                                            });
                                          },
                                          child: Container(
                                            height: 50,
                                            color: Colors.transparent,
                                            child: Column(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/icons/ic_circle.svg'),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  AppLocalizations.of(context)!
                                                      .circle,
                                                  style: AppStyle
                                                      .DEFAUlT_CONTENT.copyWith(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12,
                                                    color:
                                                        const Color(0xFF2F2CCC),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // preEditCubit.isCircleUi = false;
                                            // setState(() {
                                            //   preEditCubit.turnOffBorder = true;
                                            // });
                                          },
                                          child: Container(
                                            height: 50,
                                            color: Colors.transparent,
                                            child: Column(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/icons/ic_heart.svg'),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  AppLocalizations.of(context)!
                                                      .heart,
                                                  style: AppStyle
                                                      .DEFAUlT_CONTENT.copyWith(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12,
                                                    color:
                                                        const Color(0xFF2F2CCC),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // preEditCubit.isCircleUi = false;
                                            // cropController
                                            //   ..withCircleUi = false
                                            //   ..aspectRatio = 1;
                                            // setState(() {
                                            //   preEditCubit.turnOffBorder = true;
                                            // });
                                          },
                                          child: Container(
                                            height: 50,
                                            color: Colors.transparent,
                                            child: Column(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/icons/ic_diamond.svg'),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  AppLocalizations.of(context)!
                                                      .diamond,
                                                  style: AppStyle
                                                      .DEFAUlT_CONTENT.copyWith(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12,
                                                    color:
                                                        const Color(0xFF2F2CCC),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // preEditCubit.isCircleUi = true;
                                            // cropController.withCircleUi = true;
                                            // setState(() {
                                            //   preEditCubit.turnOffBorder = true;
                                            // });
                                          },
                                          child: Container(
                                            height: 50,
                                            color: Colors.transparent,
                                            child: Column(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/icons/ic_cat_face.svg'),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  AppLocalizations.of(context)!
                                                      .cat_face,
                                                  style: AppStyle
                                                      .DEFAUlT_CONTENT.copyWith(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12,
                                                    color:
                                                        const Color(0xFF2F2CCC),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                      ],
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(
                        bottom: AppValue.heights * 0.06 +
                            MediaQuery.of(context).padding.bottom),
                    height: 42,
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
                        'assets/icons/ic_removeBgr.svg',
                        'assets/icons/ic_cut.svg',
                        'assets/icons/ic_crop.svg',
                      ],
                      color: Colors.redAccent,
                      buttonBackgroundColor: Colors.yellowAccent,
                      backgroundColor: Colors.transparent,
                      animationCurve: Curves.linearToEaseOut,
                      animationDuration: const Duration(milliseconds: 300),
                      onTap: (index) {
                        setState(() {
                          if (unSelect = true) {
                            functionLabel = lable[index];
                            if (index == 0) {
                              print('remove');
                              preEditCubit.turnOffBorder = false;
                              preEditCubit.cropper = false;
                              preEditCubit
                                  .removeImageBGByApi(widget.image!.path);
                            } else if (index == 1) {
                              print("cut");
                              preEditCubit.turnOffBorder = false;
                              preEditCubit.cropper = false;
                            } else if (index == 2) {
                              preEditCubit.cropper = !preEditCubit.cropper;
                              preEditCubit.turnOffBorder =
                                  !preEditCubit.turnOffBorder;
                              //preEditCubit.cropper = !preEditCubit.cropper;
                              print("crop");
                            }
                          }
                        });
                      },
                      letIndexChange: (index) => true,
                    ),
                  ),
                ),
                if (preEditCubit.isCropping)
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.black.withOpacity(0.7),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/loading.gif',
                          height: 83,
                          width: 83,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Cropping',
                          style: TextStyle(
                              color: Color(0xFF00FFFF),
                              fontWeight: FontWeight.w800,
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
