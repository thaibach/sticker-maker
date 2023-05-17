import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum ImageQuality { low, medium, high }

class SaveViewImage extends StatelessWidget {
  final Widget child;
  const SaveViewImage({Key? key, required this.child}) : super(key: key);

  static Future<Uint8List?> saveAsUint8List(ImageQuality imageQuality) async {
    try {
      Uint8List? pngBytes;
      double pixelRatio = 1;
      if (imageQuality == ImageQuality.high) {
        pixelRatio = 5;
      } else if (imageQuality == ImageQuality.low) {
        pixelRatio = 0.5;
      }
      // delayed by few seconds because it takes some time to update the state by RenderRepaintBoundary
      await Future.delayed(const Duration(milliseconds: 700))
          .then((value) async {
        RenderRepaintBoundary boundary = stickGlobalKey.currentContext
            ?.findRenderObject() as RenderRepaintBoundary;
        ui.Image image = await boundary.toImage(pixelRatio: pixelRatio);
        ByteData? byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        pngBytes = byteData?.buffer.asUint8List();
      });
      return pngBytes;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: stickGlobalKey,
      child: child,
    );
  }
}

final GlobalKey stickGlobalKey = GlobalKey();
