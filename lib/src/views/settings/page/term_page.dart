import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sticker_maker/src/utils/spacing.dart';

import '../common/policy_constant.dart';

class TermPage extends StatelessWidget {
  const TermPage({super.key});

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
                      "Terms of use",
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
                child: Expanded(
                  child: Container(
                    child: Scrollbar(
                      // mainAxisMargin: MediaQueryData.fromWindow(WidgetsBinding.instance.window).viewPadding.top - 47,
                      radius: Radius.circular(20),
                      interactive: true,
                      isAlwaysShown: true,
                      scrollbarOrientation: ScrollbarOrientation.right,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 31),
                              const Text(
                                PolicyConstantTerm.contentTerm,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                PolicyConstantTerm.contentTime,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                PolicyConstantTerm.content_00,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                PolicyConstantTerm.content_001,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                PolicyConstantTerm.content_002,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                PolicyConstantTerm.content_003,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                PolicyConstantTerm.content_004,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                PolicyConstantTerm.content_005,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
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
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nunito',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: PolicyConstantTerm.content_1,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nunito',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
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
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nunito',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: PolicyConstantTerm.content_2,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nunito',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
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
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nunito',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: PolicyConstantTerm.content_3,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nunito',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
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
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nunito',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: PolicyConstantTerm.content_4,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nunito',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
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
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nunito',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: PolicyConstantTerm.content_5,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nunito',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
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
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nunito',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: PolicyConstantTerm.content_6,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nunito',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
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
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nunito',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: PolicyConstantTerm.content_7,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nunito',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
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
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nunito',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: PolicyConstantTerm.content_8,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nunito',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
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
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nunito',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: PolicyConstantTerm.content_9,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nunito',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
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
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nunito',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: PolicyConstantTerm.content_10,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nunito',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
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
                                PolicyConstantTerm.content_11,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_200,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_201,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_202,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_203,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_204,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_12,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_500,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_501,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_502,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_13,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_600,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_601,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_14,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_700,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_701,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_702,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_15,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_800,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_801,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_802,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_16,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_900,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_17,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_1000,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_18,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_1001,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_19,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_1002,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_20,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_21,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_1003,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
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
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_1004,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_23,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_1005,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_24,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_1006,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_1007,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_25,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                textAlign: TextAlign.justify,
                                PolicyConstantTerm.content_400,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
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
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nunito',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
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
