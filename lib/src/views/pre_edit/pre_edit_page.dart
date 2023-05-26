import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Uint8List, rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sticker_maker/src/cubit/cubit_index.dart';
import 'package:sticker_maker/src/utils/utils_index.dart';
import 'package:sticker_maker/src/views/edit/edit_sticker_page.dart';
import 'package:sticker_maker/src/views/views_index.dart';
import 'package:sticker_maker/src/widgets/custom/crop_your_image.dart';
import 'package:sticker_maker/src/widgets/widgets_index.dart';

import '../../widgets/custom/buttom_bar/curved_buttom_bar.dart';

class PreEditPage extends StatefulWidget {
  final File? image;

  const PreEditPage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<PreEditPage> createState() => _PreEditPageState();
}

class _PreEditPageState extends State<PreEditPage> {
  String functionLabel = '';
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  bool unSelect = false;
  PreEditCubit preEditCubit = PreEditCubit();

  List<String> lable = ["Remove background", "Manual crop", "Frame crop"];

  @override
  void initState() {
    preEditCubit.turnOffBorder = false;
    loadImageBytes();
    super.initState();
  }

  void loadImageBytes() async {
    try {
      File imagefile = File(widget.image!.path); //convert Path to File
      Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
      String base64string = base64.encode(imagebytes); //convert bytes to base64 string
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
  Widget build(BuildContext context) {
    return BlocConsumer<PreEditCubit, PreEditState>(
      bloc: preEditCubit,
      listener: (context, state) {
        if (state is RemoveBGLoading) {
          Loading.show(context, '');
        }
        if (state is RemoveBGSuccess) {
          Loading.hide(context);
          AppNavigate.navigatePage(context, EditStickerPage(imagePath: preEditCubit.resultPath));
        }
        if (state is CropEditSuccess) {
          // AppNavigate.navigatePage(context, EditScreen(image: state.path));
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return GestureDetector(onTap: () => Navigator.pop(context), child: Image.file(File(state.path)));
              });
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
                        top: Spacing.viewPadding.top + 5,
                        right: 10,
                        left: 10,
                        bottom: Spacing.viewPadding.bottom + AppValue.heights * 0.06),
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
                                AppNavigate.replacePage(context, const HomePage());
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20, left: 22, bottom: 21),
                                child: SvgPicture.asset('assets/icons/ic_back_home.svg'),
                              ),
                            ),
                            Text(
                              functionLabel,
                              style: AppStyle.DEFAULT_16.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 22),
                              child: SvgPicture.asset('assets/icons/ic_save.svg'),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8, right: 8, top: 10),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.65,
                          child: Visibility(
                            visible: preEditCubit.croppedData != null,
                            replacement: Center(
                              child: preEditCubit.croppedData == null
                                  ? const SizedBox.shrink()
                                  : Image.memory(preEditCubit.croppedData!),
                            ),
                            child: Stack(
                              children: [
                                preEditCubit.croppedData == null
                                    ? const CircularProgressIndicator()
                                    : Crop(
                                        controller: preEditCubit.cropController,
                                        image: preEditCubit.croppedData!,
                                        onCropped: (croppedDatas) {
                                          print(croppedDatas);
                                          setState(() {
                                            preEditCubit.croppedData = croppedDatas;
                                            preEditCubit.isCropping = false;
                                          });
                                        },
                                        withCircleUi: preEditCubit.isCircleUi,
                                        onStatusChanged: (status) => setState(() {
                                          preEditCubit.statusText = <CropStatus, String>{
                                                CropStatus.nothing: 'Crop has no image data',
                                                CropStatus.loading: 'Crop is now loading given image',
                                                CropStatus.ready: 'Crop is now ready!',
                                                CropStatus.cropping: 'Crop is now cropping image',
                                              }[status] ??
                                              '';
                                        }),
                                        initialSize: 1.0,
                                        //     maskColor: preEditCubit.isSumbnail ? Colors.red : null,
                                        cornerDotBuilder: (size, edgeAlignment) => Container(
                                          height: 24,
                                          width: 24,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5), color: const Color(0xFFFF84EB)),
                                        ),
                                        interactive: true,
                                        //fixArea: false,
                                        radius: 5,
                                        initialAreaBuilder: (rect) {
                                          return Rect.fromLTRB(
                                            rect.left + 24,
                                            rect.top + 24,
                                            rect.right - 24,
                                            rect.bottom - 24,
                                          );
                                        },
                                        preEditCubit: preEditCubit,
                                      ),
                              ],
                            ),
                          ),
                        ),
                        preEditCubit.cropper == true
                            ? Column(
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          preEditCubit.isCircleUi = false;
                                          preEditCubit.cropController
                                            ..withCircleUi = false
                                            ..aspectRatio = 1;
                                          setState(() {
                                            preEditCubit.turnOffBorder = true;
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            SvgPicture.asset('assets/icons/ic_rectangle.svg'),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              AppLocalizations.of(context)!.rectangle,
                                              style: AppStyle.DEFAUlT_CONTENT.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: const Color(0xFF2F2CCC),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          preEditCubit.isCircleUi = true;
                                          preEditCubit.cropController.withCircleUi = true;
                                          setState(() {
                                            preEditCubit.turnOffBorder = true;
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            SvgPicture.asset('assets/icons/ic_circle.svg'),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              AppLocalizations.of(context)!.circle,
                                              style: AppStyle.DEFAUlT_CONTENT.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: const Color(0xFF2F2CCC),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          preEditCubit.isCircleUi = false;
                                          preEditCubit.cropController.aspectRatio = 2 / 1;
                                          setState(() {
                                            preEditCubit.turnOffBorder = true;
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            SvgPicture.asset('assets/icons/ic_heart.svg'),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              AppLocalizations.of(context)!.heart,
                                              style: AppStyle.DEFAUlT_CONTENT.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: const Color(0xFF2F2CCC),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          preEditCubit.isCircleUi = false;
                                          preEditCubit.cropController
                                            ..withCircleUi = false
                                            ..aspectRatio = 1;
                                          setState(() {
                                            preEditCubit.turnOffBorder = true;
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            SvgPicture.asset('assets/icons/ic_diamond.svg'),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              AppLocalizations.of(context)!.diamond,
                                              style: AppStyle.DEFAUlT_CONTENT.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: const Color(0xFF2F2CCC),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          preEditCubit.isCircleUi = true;
                                          preEditCubit.cropController.withCircleUi = true;
                                          setState(() {
                                            preEditCubit.turnOffBorder = true;
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            SvgPicture.asset('assets/icons/ic_cat_face.svg'),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              AppLocalizations.of(context)!.cat_face,
                                              style: AppStyle.DEFAUlT_CONTENT.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: const Color(0xFF2F2CCC),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Container(),
                      ],
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: AppValue.heights * 0.06 + Spacing.viewPadding.bottom),
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
                              preEditCubit.removeImageBG(widget.image!.path);
                            } else if (index == 1) {
                              print("cut");
                              preEditCubit.turnOffBorder = false;
                              preEditCubit.cropper = false;
                            } else if (index == 2) {
                              preEditCubit.cropper = true;
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
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
