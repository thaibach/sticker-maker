// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sticker_maker/src/utils/style.dart';
import 'package:sticker_maker/src/views/settings/cubit/setting_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsLoading());

  showFeedback(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          height: 354,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 19, top: 12, right: 16, bottom: 17),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Expanded(
                        child: const Text(
                          "Cancel",
                          style: AppStyle.DEFAUlT_CONTENT_TEXT_SPAN_FEED,
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      flex: 3,
                      child: const Text(
                        "Give us your feedback",
                        style: AppStyle.DEFAUlT_LABELBACK_FEED,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: OutlineGradientButton(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        radius: const Radius.circular(50),
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFF28B6), Color(0xFF5060F5), Color(0xFF5060F5)],
                          begin: Alignment.topLeft,
                        ),
                        strokeWidth: 1,
                        child: const Text(
                          "Send",
                          style: AppStyle.DEFAUlT_CONTENT_TEXT_SPAN,
                          textAlign: TextAlign.center,
                        ),
                      ),
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
        ),
      ),
    );
  }

  share() async {
    await Share.share('https://play.google.com/store/apps/details?id=com.intes.backgrounderaser');
  }
}
