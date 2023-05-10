import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

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
                padding: const EdgeInsets.only(top: 31),
                color: Colors.white,
                child: Column(
                  
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
