import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sticker_maker/src/views/settings/component/custom_choice_settings.dart';
import 'package:sticker_maker/src/views/settings/page/about_us_page.dart';
import 'package:sticker_maker/src/views/settings/page/language_page.dart';
import 'package:sticker_maker/src/views/settings/page/privacy_page.dart';
import 'package:sticker_maker/src/views/settings/page/term_page.dart';

class SettingPage extends StatefulWidget {
  SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/img_bgr_sticker.png"), fit: BoxFit.fill)),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(bottom: 31),
            padding: const EdgeInsets.only(top: 58, left: 23, bottom: 12),
            decoration: const BoxDecoration(color: Color.fromRGBO(135, 193, 255, 0.5)),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/icons/ic_backBtn.svg"),
                      const SizedBox(
                        width: 9,
                      ),
                      const Text(
                        "Back to home",
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 26),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Settings",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutPage(),
                    ));
              },
              child: ChosenSetting(icon: "assets/icons/ic_About.svg", text: "About us")),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TermPage(),
                    ));
              },
              child: ChosenSetting(icon: "assets/icons/ic_Term.svg", text: "Terms of use")),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrivacyPage(),
                    ));
              },
              child: ChosenSetting(icon: "assets/icons/ic_Privacy.svg", text: "Privacy policy")),
          GestureDetector(
              onTap: () {}, child: ChosenSetting(icon: "assets/icons/ic_Share.svg", text: "Share this app")),
          GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => LanguagePage(),
                //     ));
              },
              child: ChosenSetting(icon: "assets/icons/ic_Lang.svg", text: "Languages")),
          GestureDetector(onTap: () {}, child: ChosenSetting(icon: "assets/icons/ic_Feed.svg", text: "Feedback"))
        ]),
      ),
    );
  }
}
