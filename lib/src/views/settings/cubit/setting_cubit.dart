// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:sticker_maker/src/utils/style.dart';
import 'package:sticker_maker/src/views/settings/cubit/setting_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsLoading());

  showOptionShare(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              gradient: LinearGradient(
                  colors: [Color(0xFFDE225B).withOpacity(0.7), Color(0xFFE46D39).withOpacity(0.7)],
                  begin: Alignment.topLeft)),
          height: 340,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 12),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/ic_Share.svg",
                      width: 18,
                      color: Colors.white,
                    ),
                    SizedBox(width: 12),
                    Text(
                      "Share this app",
                      style: AppStyle.DEFAUlT_CONTENT_TEXT_FEED_SHARE_SOCIALMEDIA,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            SvgPicture.asset("assets/icons/ic_mess.svg"),
                            const Text(
                              "Messenger",
                              style: AppStyle.DEFAUlT_CONTENT_TEXT_FEED_SOCIALMEDIA,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            SvgPicture.asset("assets/icons/ic_fb.svg"),
                            const Text(
                              "Facebook",
                              style: AppStyle.DEFAUlT_CONTENT_TEXT_FEED_SOCIALMEDIA,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            SvgPicture.asset("assets/icons/ic_ig.svg"),
                            const Text(
                              "Instagram",
                              style: AppStyle.DEFAUlT_CONTENT_TEXT_FEED_SOCIALMEDIA,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 11),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            SvgPicture.asset("assets/icons/ic_copyURL.svg"),
                            const Text(
                              "Copy URL",
                              style: AppStyle.DEFAUlT_CONTENT_TEXT_FEED_SOCIALMEDIA,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            SvgPicture.asset("assets/icons/ic_more.svg"),
                            const Text(
                              "More",
                              style: AppStyle.DEFAUlT_CONTENT_TEXT_FEED_SOCIALMEDIA,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  showFeedback(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 19, top: 12, right: 16, bottom: 17),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Cancel",
                        style: AppStyle.DEFAUlT_CONTENT_TEXT_SPAN_FEED,
                      ),
                    ),
                    const Text(
                      "Give us your feedback",
                      style: AppStyle.DEFAUlT_LABELBACK_FEED,
                    ),
                    OutlineGradientButton(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      radius: const Radius.circular(50),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF28B6), Color(0xFF5060F5), Color(0xFF5060F5)],
                        begin: Alignment.topLeft,
                      ),
                      strokeWidth: 1,
                      child: const Text("Send", style: AppStyle.DEFAUlT_CONTENT_TEXT_SPAN),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      "Your feedback will help us better",
                      style: AppStyle.DEFAUlT_CONTENT_TEXT_SETTINGSFEED,
                    ),
                  ),
                  Divider(color: Color(0xFF848FF0)),
                  SizedBox(height: 9),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration.collapsed(hintText: "Tell us What your issue?"),
                      style: AppStyle.DEFAUlT_CONTENT_TEXT_NOR,
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
