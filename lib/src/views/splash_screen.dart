import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sticker_maker/src/utils/spacing.dart';
import 'package:sticker_maker/src/utils/style.dart';
import 'package:sticker_maker/src/utils/values.dart';
import 'package:sticker_maker/src/views/home/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer( Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = const LinearGradient(
      colors: <Color>[Color(0xFFDE225B), Color(0xFFE46D39)],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/img_bgr_sticker.png'),
            fit: BoxFit.cover,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 285,
                width: double.infinity,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.108,
                width: MediaQuery.of(context).size.width * 0.226,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(70)),
                child: Image.asset(
                  'assets/images/img_Icon_app.png',
                  height: MediaQuery.of(context).size.height * 0.178,
                  width: MediaQuery.of(context).size.width * 0.226,
                ),
              ),
              Text(
                'Isticker!',
                style: AppStyle.DEFAULT_24.copyWith(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  foreground: Paint()..shader = linearGradient,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(left: 40,right: 40),
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                        colors: [
                          Color(0xFFFF28B6),
                          Color(0xFF5060F5),
                        ]
                    )
                  ),
                  child: LinearPercentIndicator(
                    // linearGradient: const LinearGradient(
                    //   colors: [
                    //     Colors.blue,
                    //     Colors.red,
                    //     Colors.red,
                    //   ]
                    // ),
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    barRadius: const Radius.circular(20),
                    animation: true,
                    animationDuration: 3000,
                    lineHeight: 40,
                    percent: 1,
                    progressColor: const Color(0xFF50F4FF),
                    backgroundColor: const Color(0xFF959595),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
                width: double.infinity,
              ),
            ],
          )),
    );
  }
}
