import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sticker_maker/src/utils/style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});

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
                    child: Text(AppLocalizations.of(context)!.about_us, style: AppStyle.DEFAUlT_LABEL),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 31),
                color: Colors.white,
                child: Column(
                  children: [
                    Image.asset("assets/icons/logo.png", width: 80),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Isticker",
                          style: TextStyle(fontFamily: 'Nunito', fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                        Text(AppLocalizations.of(context)!.version_app,
                            style: TextStyle(fontFamily: 'Nunito', fontSize: 12, fontWeight: FontWeight.w500))
                      ],
                    ),
                    const SizedBox(height: 53),
                    Padding(
                      padding: EdgeInsets.all(35),
                      child: Text(
                        AppLocalizations.of(context)!.info_app,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontFamily: 'Nunito', fontSize: 12, color: Color(0xFF6C6C6C)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.made_by,
                    style: const TextStyle(fontFamily: 'Nunito', fontSize: 12, color: Color(0xFF6C6C6C)),
                  ),
                  const Text(
                    "Tech Intes",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
