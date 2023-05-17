import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sticker_maker/src/utils/style.dart';

import '../common/policy_constant.dart';

class TermPage extends StatelessWidget {
  TermPage({super.key});

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
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Terms of use",
                      textAlign: TextAlign.left,
                      style: AppStyle.DEFAUlT_LABEL,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: Container(
                          child: Scrollbar(
                            thickness: 6.56,
                            thumbVisibility: true,
                            radius: const Radius.circular(20),
                            interactive: true,
                            scrollbarOrientation: ScrollbarOrientation.right,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 35),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 31),
                                    const Text(PolicyConstantTerm.contentTerm, style: AppStyle.DEFAUlT_LABELBACK),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
                                    ),
                                    const Text(PolicyConstantTerm.contentTime, style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
                                      height: 5,
=======
                                      height: 10,
                                    ),
                                    const Text(PolicyConstantTerm.contentTime, style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(PolicyConstantTerm.content_00,
                                        textAlign: TextAlign.justify, style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
                                    ),
                                    const Text(PolicyConstantTerm.content_001, style: AppStyle.DEFAUlT_LABELBACK),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(PolicyConstantTerm.content_002, style: AppStyle.DEFAUlT_CONTENT),
                                    const SizedBox(
                                      height: 5,
=======
                                      height: 10,
                                    ),
                                    const Text(PolicyConstantTerm.content_001, style: AppStyle.DEFAUlT_LABELBACK),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(PolicyConstantTerm.content_002, style: AppStyle.DEFAUlT_CONTENT),
                                    const SizedBox(
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(PolicyConstantTerm.content_003,
                                        textAlign: TextAlign.justify, style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
                                    ),
                                    const Text(PolicyConstantTerm.content_004, style: AppStyle.DEFAUlT_LABELBACK),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(PolicyConstantTerm.content_005, style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
                                      height: 5,
=======
                                      height: 10,
                                    ),
                                    const Text(PolicyConstantTerm.content_004, style: AppStyle.DEFAUlT_LABELBACK),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(PolicyConstantTerm.content_005, style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
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
                                                text: PolicyConstantTerm.content_01,
                                                style: AppStyle.DEFAUlT_CONTENT_TEXT_SPAN),
                                            const TextSpan(
                                                text: PolicyConstantTerm.content_1,
                                                style: AppStyle.DEFAUlT_CONTENT_TEXT_NOR)
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
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
                                                text: PolicyConstantTerm.content_02,
                                                style: AppStyle.DEFAUlT_CONTENT_TEXT_SPAN),
                                            const TextSpan(
                                                text: PolicyConstantTerm.content_2,
                                                style: AppStyle.DEFAUlT_CONTENT_TEXT_NOR)
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
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
                                                text: PolicyConstantTerm.content_03,
                                                style: AppStyle.DEFAUlT_CONTENT_TEXT_SPAN),
                                            const TextSpan(
                                                text: PolicyConstantTerm.content_3,
                                                style: AppStyle.DEFAUlT_CONTENT_TEXT_NOR)
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
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
                                                text: PolicyConstantTerm.content_04,
                                                style: AppStyle.DEFAUlT_CONTENT_TEXT_SPAN),
                                            const TextSpan(
                                                text: PolicyConstantTerm.content_4,
                                                style: AppStyle.DEFAUlT_CONTENT_TEXT_NOR)
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
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
                                                text: PolicyConstantTerm.content_05,
                                                style: AppStyle.DEFAUlT_CONTENT_TEXT_SPAN),
                                            const TextSpan(
                                                text: PolicyConstantTerm.content_5,
                                                style: AppStyle.DEFAUlT_CONTENT_TEXT_NOR)
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
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
                                                text: PolicyConstantTerm.content_06,
                                                style: AppStyle.DEFAUlT_CONTENT_TEXT_SPAN),
                                            const TextSpan(
                                                text: PolicyConstantTerm.content_6,
                                                style: AppStyle.DEFAUlT_CONTENT_TEXT_NOR)
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
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
                                                text: PolicyConstantTerm.content_07,
                                                style: AppStyle.DEFAUlT_CONTENT_TEXT_SPAN),
                                            const TextSpan(
                                                text: PolicyConstantTerm.content_7,
                                                style: AppStyle.DEFAUlT_CONTENT_TEXT_NOR)
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
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
                                                text: PolicyConstantTerm.content_08,
                                                style: AppStyle.DEFAUlT_CONTENT_TEXT_SPAN),
                                            const TextSpan(
                                                text: PolicyConstantTerm.content_8,
                                                style: AppStyle.DEFAUlT_CONTENT_TEXT_NOR)
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
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
                                                text: PolicyConstantTerm.content_09,
                                                style: AppStyle.DEFAUlT_CONTENT_TEXT_SPAN),
                                            const TextSpan(
                                                text: PolicyConstantTerm.content_9,
                                                style: AppStyle.DEFAUlT_CONTENT_TEXT_NOR)
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
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
                                                text: PolicyConstantTerm.content_010,
                                                style: AppStyle.DEFAUlT_CONTENT_TEXT_SPAN),
                                            const TextSpan(
                                                text: PolicyConstantTerm.content_10,
                                                style: AppStyle.DEFAUlT_CONTENT_TEXT_NOR)
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_11,
                                        style: AppStyle.DEFAUlT_LABELBACK),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_200,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_201,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_202,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_203,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_204,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_12,
                                        style: AppStyle.DEFAUlT_LABELBACK),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_500,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_501,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_502,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_13,
                                        style: AppStyle.DEFAUlT_LABELBACK),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_600,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_601,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_14,
                                        style: AppStyle.DEFAUlT_LABELBACK),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_700,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_701,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_702,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_15,
                                        style: AppStyle.DEFAUlT_LABELBACK),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_800,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_801,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_802,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_16,
                                        style: AppStyle.DEFAUlT_LABELBACK),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_900,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_17,
                                        style: AppStyle.DEFAUlT_LABELBACK),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_1000,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_18,
                                        style: AppStyle.DEFAUlT_LABELBACK),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_1001,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_19,
                                        style: AppStyle.DEFAUlT_LABELBACK),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_1002,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_20,
                                        style: AppStyle.DEFAUlT_LABELBACK),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstantTerm.content_21,
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      style: AppStyle.DEFAUlT_CONTENT,
                                    ),
                                    const SizedBox(
                                      height: 5,
=======
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Nunito',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_1003,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_22,
                                        style: AppStyle.DEFAUlT_CONTENT),
                                    const SizedBox(
                                      height: 5,
=======
                                      height: 10,
                                    ),
                                    const Text(
                                      textAlign: TextAlign.justify,
                                      PolicyConstantTerm.content_22,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Nunito',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_1004,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_23,
                                        style: AppStyle.DEFAUlT_LABELBACK),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_1005,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_24,
                                        style: AppStyle.DEFAUlT_LABELBACK),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_1006,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_1007,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_25,
                                        style: AppStyle.DEFAUlT_LABELBACK),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
                                    ),
                                    const Text(
                                        textAlign: TextAlign.justify,
                                        PolicyConstantTerm.content_400,
                                        style: AppStyle.DEFAUlT_CONTENT_TEXT),
                                    const SizedBox(
<<<<<<< lib/src/views/settings/page/term_page.dart
                                      height: 5,
=======
                                      height: 10,
>>>>>>> lib/src/views/settings/page/term_page.dart
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
                                                text: PolicyConstantTerm.content_300,
                                                style: AppStyle.DEFAUlT_CONTENT_TEXT_NOR),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
            Container(
              color: Colors.transparent,
              height: 100,
              // decoration: const BoxDecoration(color: Color.fromRGBO(135, 193, 255, 0.1)),
            )
          ],
        ),
      ),
    );
  }
}
