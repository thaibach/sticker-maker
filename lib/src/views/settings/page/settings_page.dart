import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sticker_maker/src/utils/style.dart';
import 'package:sticker_maker/src/views/add_sticker_to_pack/page/add_to_pack.dart';
import 'package:sticker_maker/src/views/home/home_page.dart';
import 'package:sticker_maker/src/views/settings/component/custom_choice_settings.dart';
import 'package:sticker_maker/src/views/settings/component/custom_components_settings.dart';
import 'package:sticker_maker/src/views/settings/cubit/setting_cubit.dart';
import 'package:sticker_maker/src/views/settings/page/about_us_page.dart';
import 'package:sticker_maker/src/views/settings/page/language_page.dart';
import 'package:sticker_maker/src/views/settings/page/privacy_page.dart';
import 'package:sticker_maker/src/views/settings/page/term_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late SettingsCubit _settingsCubit;

  @override
  void initState() {
    _settingsCubit = SettingsCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/img_bgr_sticker.png"), fit: BoxFit.fitWidth)),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(bottom: 31),
                padding: const EdgeInsets.only(top: 38, left: 23, bottom: 12),
                decoration: const BoxDecoration(color: Color.fromRGBO(135, 193, 255, 0.25)),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.pop(context); bug den man hinh neu dung pop, chua tim ra nguyen nhan :D
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20, top: 10, bottom: 26),
                            child: SvgPicture.asset("assets/icons/ic_backBtn.svg"),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(AppLocalizations.of(context)!.settings,
                          textAlign: TextAlign.left, style: AppStyle.DEFAUlT_LABEL),
                    )
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
                  },
                  child:
                      ChosenSetting(icon: "assets/icons/ic_About.svg", text: AppLocalizations.of(context)!.about_us)),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TermPage()));
                  },
                  child: ChosenSetting(
                      icon: "assets/icons/ic_Term.svg", text: AppLocalizations.of(context)!.terms_of_use)),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPage()));
                  },
                  child: ChosenSetting(
                      icon: "assets/icons/ic_Privacy.svg", text: AppLocalizations.of(context)!.privacy_policy)),
              GestureDetector(
                  onTap: () {
                    _settingsCubit.share();
                  },
                  child: ChosenSetting(
                      icon: "assets/icons/ic_Share.svg", text: AppLocalizations.of(context)!.share_this_app)),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LanguagePage()));
                  },
                  child: ChosenSettingLang(
                    icon: "assets/icons/ic_Lang.svg",
                    text: AppLocalizations.of(context)!.language,
                    tail: AppLocalizations.of(context)!.language_default,
                  )),
              GestureDetector(
                  onTap: () {
                    customComponentsSetting(_settingsCubit).showFeedback(context);
                  },
                  child: ChosenSetting(icon: "assets/icons/ic_Feed.svg", text: AppLocalizations.of(context)!.feedback))
            ]),
          ),
        ),
      ),
    );
  }
}
