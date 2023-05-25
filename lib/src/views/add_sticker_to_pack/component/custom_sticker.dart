// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomSticker extends StatelessWidget {
  CustomSticker({super.key, required this.link});
  final String link;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Image.asset(link, width: 80, height: 80),
    );
  }
}
