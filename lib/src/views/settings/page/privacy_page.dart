import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sticker_maker/src/utils/spacing.dart';

import '../common/policy_constant.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/img_bgr_sticker.png"), fit: BoxFit.fill)),
        child: Column(
          children: [
            Container(
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
                          "Settings",
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
                      "Privacy policy",
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
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        child: Scrollbar(
                          interactive: true,
                          isAlwaysShown: true,
                          radius: const Radius.circular(20),
                          scrollbarOrientation: ScrollbarOrientation.right,
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
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
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_002,
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_003,
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_03,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_04,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_05,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_06,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_004,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_005,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_07,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontSize: 16),
                                  ),
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
                                            text: PolicyConstant.content_1,
                                            style: TextStyle(
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                                fontSize: 12),
                                          )
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
                                            style: TextStyle(
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                                fontSize: 12),
                                          )
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
                                            style: TextStyle(
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                                fontSize: 12),
                                          )
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
                                            style: TextStyle(
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                                fontSize: 12),
                                          )
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
                                            style: TextStyle(
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                                fontSize: 12),
                                          )
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
                                            style: TextStyle(
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                                fontSize: 12),
                                          )
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
                                            style: TextStyle(
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                                fontSize: 12),
                                          )
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
                                            style: TextStyle(
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                                fontSize: 12),
                                          )
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
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_2,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_31,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_3,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_006,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_007,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_41,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_4,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_008,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_51,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_5,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_009,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_010,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_011,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_61,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_6,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_012,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_013,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_014,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_015,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_016,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_017,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_018,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_71,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_7,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_019,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_81,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_8,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_020,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_91,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.justify,
                                    PolicyConstant.content_9,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
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
            Container(
              height: 100,
              decoration: const BoxDecoration(color: Color.fromRGBO(135, 193, 255, 0.1)),
            )
          ],
        ),
      ),
    );
  }
}