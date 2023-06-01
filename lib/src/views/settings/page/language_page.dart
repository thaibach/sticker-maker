import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:sticker_maker/src/utils/style.dart';
import 'package:sticker_maker/src/views/settings/cubit/setting_cubit.dart';

class LanguagePage extends StatefulWidget {
  LanguagePage({
    super.key,
  });
  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  bool showTickGreen = false;
  bool showGreenborder = false;
  String? langCode;
  bool disableBtn = false;

  @override
  void initState() {
    setState(() {
      disableBtn = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    return Scaffold(
      body: Builder(builder: (context) {
        return Container(
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/img_bgr_sticker.png"), fit: BoxFit.fill)),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 38, left: 23, bottom: 12),
                decoration: const BoxDecoration(color: Color.fromRGBO(135, 193, 255, 0.25)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 30, top: 10, bottom: 26),
                            child: SvgPicture.asset("assets/icons/ic_backBtn.svg"),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(AppLocalizations.of(context)!.language, style: AppStyle.DEFAUlT_LABEL),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 53),
              Column(
                children: [
                  ChoseLanguge(context, AppLocalizations.of(context)!.lang_change_vi, 'vi', 1),
                  ChoseLanguge(context, AppLocalizations.of(context)!.lang_change_en, 'en', 2),
                  ChoseLanguge(context, AppLocalizations.of(context)!.lang_change_fr, 'fr', 3),
                ],
              ),
              const SizedBox(height: 87),
              OutlineGradientButton(
                onTap: () {
                  myLocale.toString() == langCode ? null : context.read<LanguageCubit>().changeLang(context, langCode!);
                  showGreenborder = false;
                  disableBtn = false;
                },
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                radius: const Radius.circular(5),
                gradient: myLocale.toString() == langCode || disableBtn == false
                    ? LinearGradient(
                        colors: [
                          Color(0xFFFF28B6).withOpacity(0.3),
                          Color(0xFF5060F5).withOpacity(0.3),
                          Color(0xFF5060F5).withOpacity(0.3)
                        ],
                        begin: Alignment.topLeft,
                      )
                    : const LinearGradient(
                        colors: [Color(0xFFFF28B6), Color(0xFF5060F5), Color(0xFF5060F5)],
                        begin: Alignment.topLeft,
                      ),
                strokeWidth: 2,
                child: Text(AppLocalizations.of(context)!.apply,
                    style: myLocale.toString() == langCode || disableBtn == false
                        ? AppStyle.DEFAUlT_CONTENT_BTN_APPLY_D
                        : AppStyle.DEFAUlT_CONTENT_BTN_APPLY),
              )
            ],
          ),
        );
      }),
    );
  }

  late int value = 0;
  // ignore: non_constant_identifier_names
  Widget ChoseLanguge(BuildContext context, String text, String langcode, int index) {
    Locale myLocale = Localizations.localeOf(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          langCode = langcode;
          value = index;
          disableBtn = true;
          showGreenborder = true;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        margin: const EdgeInsets.only(left: 30, top: 10, right: 30, bottom: 10),
        decoration: BoxDecoration(
            border: Border.all(
                width: 2,
                color: (value == index) && showGreenborder == true
                    ? const Color(0xFF24FF00).withOpacity(0.8)
                    : Colors.transparent),
            borderRadius: BorderRadius.circular(10),
            color: myLocale.toString() == langcode
                ? const Color.fromRGBO(187, 217, 245, 0.5)
                : const Color.fromRGBO(187, 217, 245, 0.5).withOpacity(0.8)),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  text,
                  style: myLocale.toString() == langcode
                      ? const TextStyle(fontFamily: 'Nunito', fontSize: 16, fontWeight: FontWeight.w700)
                      : const TextStyle(fontFamily: 'Nunito', fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
                child:
                    myLocale.toString() == langcode ? SvgPicture.asset("assets/icons/ic_tick.svg") : const SizedBox())
          ],
        ),
      ),
    );
  }
}
