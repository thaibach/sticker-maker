import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sticker_maker/src/utils/utils_index.dart';
import 'package:sticker_maker/src/views/settings/page/settings_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class customComponentsSetting {
  final _feedbackController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future send() async {
    if (formKey.currentState!.validate()) {
    } else {}
  }

  Future showErrorFeedBack(BuildContext context) {
    return showDialog(
        barrierColor: Colors.transparent,
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return dialogToast();
        });
  }

  showFeedback(BuildContext context) {
    Future cancel() async {
      if (_feedbackController.text.isNotEmpty) {
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
                      Text(AppLocalizations.of(context)!.discard_feedback, style: AppStyle.DEFAUlT_LABELBACK_FEED),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(AppLocalizations.of(context)!.text_discard,
                          textAlign: TextAlign.center,
                          style: AppStyle.DEFAUlT_CONTENT_TEXT_SETTINGSFEED.copyWith(color: const Color(0xFF8D8D8D))),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
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
                                AppLocalizations.of(context)!.continue_text,
                                style: AppStyle.DEFAUlT_CONTENT_TEXT_FEED_SOCIALMEDIA.copyWith(
                                    fontWeight: FontWeight.w500, color: const Color(0xFF5060B8)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          AppNavigate.navigatePage(context, SettingPage());
                        },
                        child: Container(
                          height: 30,
                          width: 250,
                          color: Colors.transparent,
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.discard,
                              style: AppStyle.DEFAUlT_CONTENT_TEXT_FEED_SOCIALMEDIA.copyWith(
                                fontWeight: FontWeight.w500,
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
      } else {
        Navigator.of(context).pop();
      }
    }

    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.white,
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            height: 354,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 19, top: 12, right: 16, bottom: 17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            cancel();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            height: 24,
                            width: 59,
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color(0xFFA5A5A5)),
                            child: Container(
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context)!.cancel,
                                  style: AppStyle.DEFAUlT_CONTENT_TEXT_SPAN,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context)!.give_us_your_feedback,
                            style: AppStyle.DEFAUlT_LABELBACK_FEED,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            send();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            height: 24,
                            width: 59,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFFF28B6),
                                  Color(0xFF5060F5),
                                  Color(0xFF5060F5),
                                ],
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context)!.send,
                                  style: AppStyle.DEFAUlT_CONTENT_TEXT_SPAN,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: const Color(0xFF848FF0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: TextFormField(
                          maxLines: 5,
                          controller: _feedbackController,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.your_issue,
                            border: InputBorder.none,
                            hintStyle: AppStyle.DEFAUlT_CONTENT_TEXT_SETTINGSFEED,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              showErrorFeedBack(context);
                            } else if (value.length < 6) {
                              showErrorFeedBack(context);
                            } else {
                              return null;
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class dialogToast extends StatefulWidget {
  const dialogToast({
    super.key,
  });

  @override
  State<dialogToast> createState() => _dialogToastState();
}

class _dialogToastState extends State<dialogToast> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pop();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
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
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: 39,
            width: 300,
            padding: const EdgeInsets.all(1.5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(colors: [
                  Color(0xFFFF28B6),
                  Color(0xFF5060F5),
                  Color(0xFF5060F5),
                ])),
            child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Text(AppLocalizations.of(context)!.at_least,
                      style: AppStyle.DEFAUlT_CONTENT_TEXT_SETTINGSFEED.copyWith(color: Colors.black)),
                  const SizedBox(
                    width: 40,
                  ),
                  Text(
                    'OK',
                    style: AppStyle.DEFAUlT_CONTENT_TEXT_SETTINGSFEED.copyWith(
                        fontWeight: FontWeight.w800, color: Colors.black),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
