import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
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
  final SettingsCubit _cubit = SettingsCubit();
  bool showTickGreen = false;
  bool showGreenborder = false;
  String localeCompare = Intl.getCurrentLocale();
  String? langCode;
  bool chooseLang = false;
  late int checkIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                context.read<LanguageCubit>().changeLang(context, langCode!);
              },
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
              radius: const Radius.circular(5),
              gradient: const LinearGradient(
                colors: [Color(0xFFFF28B6), Color(0xFF5060F5), Color(0xFF5060F5)],
                begin: Alignment.topLeft,
              ),
              strokeWidth: 2,
              child: Text(AppLocalizations.of(context)!.apply, style: AppStyle.DEFAUlT_CONTENT_BTN_APPLY),
            )
          ],
        ),
      ),
    );
  }

  int value = 0;
  // ignore: non_constant_identifier_names
  Widget ChoseLanguge(BuildContext context, String text, String langcode, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          langCode = langcode;
          value = index;
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
            color: chooseLang
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
                  style: const TextStyle(fontFamily: 'Nunito', fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(child: (value == index) ? SvgPicture.asset("assets/icons/ic_tick.svg") : const SizedBox())
          ],
        ),
      ),
    );
  }
}
