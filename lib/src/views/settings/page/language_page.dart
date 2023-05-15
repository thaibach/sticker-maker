import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:sticker_maker/src/utils/style.dart';

class LanguagePage extends StatelessWidget {
  LanguagePage({
    super.key,
  });

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
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Languages", style: AppStyle.DEFAUlT_LABEL),
                  )
                ],
              ),
            ),
            const SizedBox(height: 53),
            GestureDetector(
              onTap: () {},
              child: ChoseLanguge(context, "Vietnamese (Tiếng Việt)"),
            ),
            GestureDetector(
              onTap: () {},
              child: ChoseLanguge(context, "English"),
            ),
            GestureDetector(
              onTap: () {},
              child: ChoseLanguge(context, "France (Francais )"),
            ),
            const SizedBox(height: 87),
            OutlineGradientButton(
              padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 10),
              radius: const Radius.circular(5),
              gradient: const LinearGradient(
                colors: [Color(0xFFFF28B6), Color(0xFF5060F5), Color(0xFF5060F5)],
                begin: Alignment.topLeft,
              ),
              strokeWidth: 2,
              child: const Text("Apply", style: AppStyle.DEFAUlT_CONTENT_TEXT_SPAN),
            )
          ],
        ),
      ),
    );
  }

  Widget ChoseLanguge(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      margin: const EdgeInsets.only(left: 30, top: 10, right: 30, bottom: 10),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color.fromRGBO(187, 217, 245, 0.5)),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.only(left: 50),
              child: Text(
                text,
                style: const TextStyle(fontFamily: 'Nunito', fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
