import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sticker_maker/src/cubit/home_cubit/home_cubit.dart';
import 'package:sticker_maker/src/utils/style.dart';

class Components {
  Components(this._homeCubit);

  final HomePageCubit _homeCubit;

  Widget rowSetting(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 45,
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
                decoration: const BoxDecoration(
                  color: Color(0xFFE46D39),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> popUpImagePicker(BuildContext context, Function(String image) callBack) {
    return showModalBottomSheet<void>(
      // barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
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
                    AppLocalizations.of(context)!.import_your_photo,
                    textAlign: TextAlign.center,
                    style: AppStyle.DEFAUlT_CONTENT.copyWith(
                      color: Colors.black,
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
                              _homeCubit.getFromGallery(isChooseImage: false).then((path) {
                                callBack(path);
                              });
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
                            AppLocalizations.of(context)!.from_gallery,
                            style: AppStyle.DEFAUlT_CONTENT_TEXT_SPAN,
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
                              _homeCubit.getFromGallery(isChooseImage: true).then((path) {
                                callBack(path);
                              });
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
                            AppLocalizations.of(context)!.take_photo,
                            style: AppStyle.DEFAUlT_CONTENT_TEXT_SPAN,
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
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
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
                    AppLocalizations.of(context)!.access_disabled,
                    style: AppStyle.DEFAUlT_CONTENT_TEXT_FEED_SHARE_SOCIALMEDIA.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    AppLocalizations.of(context)!.open_permissions,
                    textAlign: TextAlign.center,
                    style: AppStyle.DEFAUlT_CONTENT_TEXT_SETTINGSFEED.copyWith(
                      color: const Color(0xFF6C6C6C),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      openAppSettings();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 6, bottom: 20),
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.54,
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          gradient: const LinearGradient(colors: [
                            Color(0xFFFF28B6),
                            Color(0xFF5060F5),
                            Color(0xFF5060F5),
                          ])),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.go_to_settings,
                            style:
                            AppStyle.DEFAUlT_CONTENT_TEXT_FEED_SOCIALMEDIA.copyWith(color: const Color(0xFF5060B8)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 30,
                      width: 250,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.btn_return,
                          style: AppStyle.DEFAUlT_CONTENT_TEXT_FEED_SOCIALMEDIA.copyWith(
                            color: const Color(0xFF626262),
                          ),
                        ),
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
