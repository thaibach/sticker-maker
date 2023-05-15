import 'dart:io';

import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  final String? image;
  const EditScreen({super.key, required this.image});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Image.file(File(widget.image!)),
    );
  }
}
