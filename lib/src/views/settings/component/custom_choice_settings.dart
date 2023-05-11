// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChosenSetting extends StatelessWidget {
  ChosenSetting({super.key, required this.icon, required this.text});

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
      margin: const EdgeInsets.only(left: 30, top: 10, right: 30, bottom: 10),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color.fromRGBO(187, 217, 245, 0.5)),
      child: Row(
        children: [
          Expanded(
              child: Container(
                  decoration: const ShapeDecoration(shape: CircleBorder(), color: Color.fromRGBO(255, 255, 255, 0.5)),
                  child: SvgPicture.asset(icon))),
          Expanded(
              flex: 5,
              child: Container(
                  margin: const EdgeInsets.only(left: 28),
                  child: Text(
                    text,
                    style: const TextStyle(fontFamily: 'Nunito', fontSize: 16, fontWeight: FontWeight.w700),
                  ))),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(11),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: SvgPicture.asset("assets/icons/ic_rightArrow.svg"),
            ),
          )
        ],
      ),
    );
  }
}
