library crop_your_image;

import 'dart:io';
import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image/image.dart' as image;
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sticker_maker/src/cubit/cubit_index.dart';
import 'package:sticker_maker/src/views/deco_rate/deco_rate_page.dart';

part 'customCrop/crop.dart';
part 'customCrop/controller.dart';
part 'customCrop/calculator.dart';
part 'customCrop/edge_alignment.dart';
