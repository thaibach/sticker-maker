import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sticker_maker/src/views/home/home_page.dart';

class DecoRatePage extends StatefulWidget {
  final File? image;
   DecoRatePage({Key? key, required this.image}) : super(key: key);

  @override
  State<DecoRatePage> createState() => _DecoRatePageState();
}

class _DecoRatePageState extends State<DecoRatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Image.file(widget.image!),
        ),
      ),
    );
  }
}
