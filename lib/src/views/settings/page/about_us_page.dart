import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
                mainAxisAlignment: MainAxisAlignment.start,
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
                      "About us",
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
                  children: [
                    Image.asset("assets/images/img_iconApp.png"),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Isticker",
                          style: TextStyle(fontFamily: 'Nunito', fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                        Text(" version 1.1.0", style: TextStyle(fontFamily: 'Nunito', fontSize: 12))
                      ],
                    ),
                    const SizedBox(height: 53),
                    const Padding(
                      padding: EdgeInsets.all(35),
                      child: Text(
                        "  You are bored with the sticker from your old app. Or those stickers can not make you satisfy. Try ours to create your own beautiful and stylized stickers. Let do it now.",
                        style: TextStyle(fontFamily: 'Nunito', fontSize: 12, color: Color(0xFF6C6C6C)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
              decoration: const BoxDecoration(color: Color.fromRGBO(135, 193, 255, 0.1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Made by ",
                    style: TextStyle(fontFamily: 'Nunito', fontSize: 12, color: Color(0xFF6C6C6C)),
                  ),
                  Text(
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
