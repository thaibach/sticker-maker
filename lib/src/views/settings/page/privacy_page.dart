import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/style.dart';
import '../common/policy_constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PrivacyPage extends StatelessWidget {
  PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sc = ScrollController(initialScrollOffset: 0);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/img_bgr_sticker.png"), fit: BoxFit.fill)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 38, left: 23, bottom: 12),
              decoration: const BoxDecoration(color: Color.fromRGBO(135, 193, 255, 0.3)),
              child: Column(
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
                    child: Text(
                      AppLocalizations.of(context)!.privacy_policy,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: Scrollbar(
                          radius: const Radius.circular(30),
                          thickness: 6.56,
                          controller: sc,
                          isAlwaysShown: true,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 35),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 27),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_01,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_02,
                                    style: AppStyle.DEFAUlT_CONTENT_TEXT,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_002,
                                    style: AppStyle.DEFAUlT_CONTENT_TEXT,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_003,
                                    style: AppStyle.DEFAUlT_CONTENT_TEXT,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_03,
                                      style: AppStyle.DEFAUlT_CONTENT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_04,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_05,
                                      style: AppStyle.DEFAUlT_CONTENT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_06,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_004,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_005,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_07,
                                      style: AppStyle.DEFAUlT_CONTENT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: RichText(
                                      textAlign: TextAlign.justify,
                                      text: const TextSpan(
                                        children: [
                                          TextSpan(
                                              text: PolicyConstant.content_1, style: AppStyle.DEFAUlT_CONTENT_TEXT_NOR)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: RichText(
                                      textAlign: TextAlign.justify,
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Padding(
                                              padding: const EdgeInsets.only(bottom: 5),
                                              child: Container(
                                                margin: const EdgeInsets.only(right: 8),
                                                height: 5,
                                                width: 5,
                                                decoration: BoxDecoration(
                                                    color: Colors.black, borderRadius: BorderRadius.circular(5)),
                                              ),
                                            ),
                                          ),
                                          const TextSpan(
                                              text: PolicyConstant.content_101,
                                              style: AppStyle.DEFAUlT_CONTENT_TEXT_NOR)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: RichText(
                                      textAlign: TextAlign.justify,
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Padding(
                                              padding: const EdgeInsets.only(bottom: 5),
                                              child: Container(
                                                margin: const EdgeInsets.only(right: 8),
                                                height: 5,
                                                width: 5,
                                                decoration: BoxDecoration(
                                                    color: Colors.black, borderRadius: BorderRadius.circular(5)),
                                              ),
                                            ),
                                          ),
                                          const TextSpan(
                                              text: PolicyConstant.content_102,
                                              style: AppStyle.DEFAUlT_CONTENT_TEXT_NOR)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: RichText(
                                      textAlign: TextAlign.justify,
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Padding(
                                              padding: const EdgeInsets.only(bottom: 5),
                                              child: Container(
                                                margin: const EdgeInsets.only(right: 8),
                                                height: 5,
                                                width: 5,
                                                decoration: BoxDecoration(
                                                    color: Colors.black, borderRadius: BorderRadius.circular(5)),
                                              ),
                                            ),
                                          ),
                                          const TextSpan(
                                              text: PolicyConstant.content_103,
                                              style: AppStyle.DEFAUlT_CONTENT_TEXT_NOR)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: RichText(
                                      textAlign: TextAlign.justify,
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Padding(
                                              padding: const EdgeInsets.only(bottom: 5),
                                              child: Container(
                                                margin: const EdgeInsets.only(right: 8),
                                                height: 5,
                                                width: 5,
                                                decoration: BoxDecoration(
                                                    color: Colors.black, borderRadius: BorderRadius.circular(5)),
                                              ),
                                            ),
                                          ),
                                          const TextSpan(
                                              text: PolicyConstant.content_104,
                                              style: AppStyle.DEFAUlT_CONTENT_TEXT_NOR)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: RichText(
                                      textAlign: TextAlign.justify,
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Padding(
                                              padding: const EdgeInsets.only(bottom: 5),
                                              child: Container(
                                                margin: const EdgeInsets.only(right: 8),
                                                height: 5,
                                                width: 5,
                                                decoration: BoxDecoration(
                                                    color: Colors.black, borderRadius: BorderRadius.circular(5)),
                                              ),
                                            ),
                                          ),
                                          const TextSpan(
                                              text: PolicyConstant.content_105,
                                              style: AppStyle.DEFAUlT_CONTENT_TEXT_NOR)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: RichText(
                                      textAlign: TextAlign.justify,
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Padding(
                                              padding: const EdgeInsets.only(bottom: 5),
                                              child: Container(
                                                margin: const EdgeInsets.only(right: 8),
                                                height: 5,
                                                width: 5,
                                                decoration: BoxDecoration(
                                                    color: Colors.black, borderRadius: BorderRadius.circular(5)),
                                              ),
                                            ),
                                          ),
                                          const TextSpan(
                                              text: PolicyConstant.content_106,
                                              style: AppStyle.DEFAUlT_CONTENT_TEXT_NOR)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: RichText(
                                      textAlign: TextAlign.justify,
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Padding(
                                              padding: const EdgeInsets.only(bottom: 5),
                                              child: Container(
                                                margin: const EdgeInsets.only(right: 8),
                                                height: 5,
                                                width: 5,
                                                decoration: BoxDecoration(
                                                    color: Colors.black, borderRadius: BorderRadius.circular(5)),
                                              ),
                                            ),
                                          ),
                                          const TextSpan(
                                              text: PolicyConstant.content_107,
                                              style: AppStyle.DEFAUlT_CONTENT_TEXT_NOR)
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_21,
                                      style: AppStyle.DEFAUlT_CONTENT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_2,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_31,
                                      style: AppStyle.DEFAUlT_CONTENT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_3,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_006,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_007,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_41,
                                      style: AppStyle.DEFAUlT_CONTENT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_4,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_008,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_51,
                                      style: AppStyle.DEFAUlT_CONTENT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_5,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_009,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_010,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_011,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_61,
                                      style: AppStyle.DEFAUlT_CONTENT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_6,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_012,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_013,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_014,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_015,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_016,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_017,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_018,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_71,
                                      style: AppStyle.DEFAUlT_CONTENT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_7,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_019,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_81,
                                      style: AppStyle.DEFAUlT_CONTENT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_8,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_020,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_91,
                                      style: AppStyle.DEFAUlT_CONTENT),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstant.content_9,
                                      style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.transparent,
                height: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
