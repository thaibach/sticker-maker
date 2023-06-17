import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sticker_maker/src/api_controller/api_controller.dart';
import 'package:sticker_maker/src/utils/utils_index.dart';

import 'pre_edit_state.dart';

class PreEditCubit extends Cubit<PreEditState> {
  CallApiFeature callApiFeature = CallApiFeature();
  PreEditCubit() : super(PreEditInitial());
  int bottomBar = 0;
  Uint8List? croppedData;
  File? file;

  String functionLabel = '';
  bool removeBg = false;
  bool cut = false;
  bool crop = false;
  bool cropHexagon = false;
  bool borderCrop = false;
  bool cropDiamond = false;
  var isSumbnail = false;
  var isCropping = false;
  var isCircleUi = false;
  bool turnOffBorder = true;
  bool cropper = false;
  var statusText = '';
  int selectedIndex = 0;

  Future<ui.Image> getImage(ui.Image oriImg, ui.Image maskImg, int imageWidth, int imageHeight) async {
    final ui.PictureRecorder recorder = ui.PictureRecorder();
    OverlayPainter painter = OverlayPainter(maskImg, oriImg);
    painter.paint(Canvas(recorder), ui.Size(imageWidth.toDouble(), imageHeight.toDouble()));
    final ui.Picture picture = recorder.endRecording();
    return await picture.toImage(imageWidth, imageHeight);
  }

  Future<void> convertUint8ListToFile(Uint8List cropperData) async {
    if (Platform.isAndroid) {
      final Directory? extDir = await getExternalStorageDirectory();
      // if(File("${extDir!.path}/${DateTime.now().microsecondsSinceEpoch}.png").existsSync()){
      //   File("${extDir.path}/${DateTime.now().microsecondsSinceEpoch}.png").delete();
      // }
      await Directory(extDir!.path).create(recursive: true);
      String outputPath = '${extDir.path}/${DateTime.now().microsecondsSinceEpoch}.png';
      File cachedFile = File(outputPath);
      cachedFile.writeAsBytesSync(cropperData);
      emit(CropEditSuccess(path: cachedFile.path));
    } else if (Platform.isIOS) {
      final Directory extDir = await getApplicationDocumentsDirectory();
      // if(File("${extDir!.path}/${DateTime.now().microsecondsSinceEpoch}.png").existsSync()){
      //   File("${extDir.path}/${DateTime.now().microsecondsSinceEpoch}.png").delete();
      // }
      await Directory(extDir.path).create(recursive: true);
      String outputPath = '${extDir.path}/${DateTime.now().microsecondsSinceEpoch}.png';
      File cachedFile = File(outputPath);
      cachedFile.writeAsBytesSync(cropperData);
      emit(CropEditSuccess(path: cachedFile.path));
    }
  }

/*
  void removeImageBG(String imagePath) async {
    emit(RemoveBGLoading());
    final tempDir = await getTemporaryDirectory();
    var imageByte = await File(imagePath).readAsBytes();
    var decodedImage = await decodeImageFromList(imageByte);

    int totalByteImage = decodedImage.width * decodedImage.height * 4;

    final Directory? extDir = await getExternalStorageDirectory();
    await Directory(extDir!.path).create(recursive: true);
    String outputPath = '${extDir.path}/cache.png';
    File cachedFile = File(outputPath);

    // using((Arena arena) {
    //   Pointer<Uint8> ptr = arena<Uint8>(totalByteImage);
    //   final args = ProcessImageArguments(imagePath, ptr, decodedImage.width,
    //       decodedImage.height, cachedFile.path);
    //
    //   makeProcessImage(args);
    // });
    Uint8List maskBytes = await cachedFile.readAsBytes();
    var decodeMask = await decodeImageFromList(maskBytes);
    if (await cachedFile.exists()) {
      await cachedFile.delete();
    }
    ui.Image picture = await getImage(decodedImage, decodeMask, decodedImage.width, decodedImage.height);
    final pictureData = await picture.toByteData(
      format: ui.ImageByteFormat.png,
    );
    Uint8List pictureBytes = pictureData!.buffer.asUint8List();
    File outFile = File("${tempDir.path}/${DateTime.now().microsecondsSinceEpoch}.png");
    outFile.writeAsBytesSync(pictureBytes);
    emit(RemoveBGSuccess(imagePath: outFile.path));
  }
*/

  void removeImageBGByApi(String imagePath) async {
    emit(RemoveBGLoading());
    final tempDir = await getTemporaryDirectory();
    var imageByte = await File(imagePath).readAsBytes();
    var decodedImage = await decodeImageFromList(imageByte);
    // int totalByteImage = decodedImage.width * decodedImage.height * 4;
    final File cachedFile;
    if (Platform.isAndroid) {
      final Directory? extDir = await getExternalStorageDirectory();
      await Directory(extDir!.path).create(recursive: true);
      String outputPath = '${extDir.path}/cache.png';
      cachedFile = File(outputPath);
      if (await cachedFile.exists()) {
        await cachedFile.delete();
      }
    } else if (Platform.isIOS) {
      final Directory extDir = await getApplicationDocumentsDirectory();
      await Directory(extDir.path).create(recursive: true);
      String outputPath = '${extDir.path}/cache.png';
      cachedFile = File(outputPath);
      if (await cachedFile.exists()) {
        await cachedFile.delete();
      }
    }
    callApiFeature.removeBgrByAPI(file: File(imagePath)).then((value) async {
      if (value != null) {
        Uint8List bytesImage = const Base64Decoder().convert(value!);
        var decodeMask = await decodeImageFromList(bytesImage);
        ui.Image picture = await getImage(decodedImage, decodeMask, decodedImage.width, decodedImage.height);
        final pictureData = await picture.toByteData(
          format: ui.ImageByteFormat.png,
        );
        Uint8List pictureBytes = pictureData!.buffer.asUint8List();
        File outFile = File("${tempDir.path}/${DateTime.now().microsecondsSinceEpoch}.png");
        outFile.writeAsBytesSync(pictureBytes);
        emit(RemoveBGSuccess(imagePath: outFile.path));
      }
    });
  }

}

