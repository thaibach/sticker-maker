import 'package:flutter/services.dart';
import 'package:sticker_maker/src/views/pack_sticker/model/package_sticker_model.dart';

abstract class AddStickerToPackState {}

class AddStickerToPackLoading extends AddStickerToPackState {
  List<PackSticker> get listPack => [];
  List<StickerChild> get stickerChild => [];
}

class Readingdata extends AddStickerToPackState {}

class AddStickerToSuccess extends AddStickerToPackState {
  final Uint8List image;
  AddStickerToSuccess({required this.image});
}
