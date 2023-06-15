import 'package:flutter/services.dart';
import 'package:sticker_maker/src/views/pack_sticker/model/package_sticker_model.dart';

abstract class AddStickerToPackState {}

class AddStickerToPackLoading extends AddStickerToPackState {}

class Readingdata extends AddStickerToPackState {
  final List<PackSticker> list;
  Readingdata({required this.list});
}

class InsertData extends AddStickerToPackState {
  dynamic listchild;
  InsertData({required this.listchild});
}

class AddStickerToSuccess extends AddStickerToPackState {
  final Uint8List image;
  AddStickerToSuccess({required this.image});
}

class RemovePackage extends AddStickerToPackState {

}
