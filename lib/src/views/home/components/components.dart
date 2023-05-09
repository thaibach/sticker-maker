import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sticker_maker/src/cubit/home_cubit/home_cubit.dart';
import 'package:sticker_maker/src/utils/style.dart';
import 'package:sticker_maker/src/views/views_index.dart';

class Components {
  Components(this._homeCubit);

  final HomePageCubit _homeCubit;

  Widget rowSetting(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 50,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 9),
            height: 50,
            width: double.infinity,
            color: const Color(0xFFE46D39),
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      color: const Color(0xFFE46D39),
                      margin: const EdgeInsets.only(
                        top: 10,
                        left: 5,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 0.25),
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      width: 10,
                      height: 60,
                      child: Container(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 60,
                padding: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                  color: Color(0xFFE46D39),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                ),
                child: Image.asset(
                  "assets/images/image_setting.png",
                  width: MediaQuery.of(context).size.width * 0.099,
                  height: MediaQuery.of(context).size.height * 0.099,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> PopUpImagePicker(BuildContext context, Function(String image)? callBack) {
    return showModalBottomSheet<void>(
      // barrierColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 38,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 51, right: 50),
                  child: Text(
                    'Which do you want to import your photo ?',
                    textAlign: TextAlign.center,
                    style: AppStyle.DEFAULT_16.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              Navigator.pop(context);
                              String path = await _homeCubit.getFromGallery(isChooseImage: false);
                              if (path.isNotEmpty) {
                                callBack!(path);
                              }
                            },
                            child: Image.asset(
                              'assets/images/img_gallery.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'From gallery',
                            style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w500, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              Navigator.pop(context);
                              String path = await _homeCubit.getFromGallery(isChooseImage: true);
                              if (path.isNotEmpty) {
                                callBack!(path);
                              }
                            },
                            child: Image.asset(
                              'assets/images/img_photo.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Take photo',
                            style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w500, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> popUpAccessRights(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  13.0,
                ),
              ),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Access disabled!',
                    style: AppStyle.DEFAULT_16.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Please go to settings to open\npermissions',
                    textAlign: TextAlign.center,
                    style: AppStyle.DEFAULT_12.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                     openAppSettings();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 6, bottom: 20),
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.54,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(colors: [
                            Color(0xFFFF28B6),
                            Color(0xFF5060F5),
                            Color(0xFF5060F5),
                          ])),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            'Go to setting',
                            style:
                                AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500, color: const Color(0xFF5060B8)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Return',
                      style: AppStyle.DEFAULT_14.copyWith(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF626262),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
