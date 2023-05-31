import 'package:flutter/services.dart';

abstract class AddStickerToPackState {}

class AddStickerToPackLoading extends AddStickerToPackState {}

class AddStickerToSuccess extends AddStickerToPackState {
  final Uint8List image;
  AddStickerToSuccess({required this.image});
}
