import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img_img;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sticker_maker/src/cubit/home_cubit/home_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageLoading());
  File? imageFile;
  Uint8List resizeImage(bytes) {
    img_img.Image? image = img_img.decodeImage(bytes);
    img_img.Image resizeImg = img_img.copyResize(image!, width: 1080);
    List<int> resizeImgList = img_img.encodePng(resizeImg);
    Uint8List resizeImgU8List = Uint8List.fromList(resizeImgList);
    return resizeImgU8List;
  }

  //lấy ảnh cần chỉnh sửa từ thư viện ảnh
  Future<String> getFromGallery({bool? isChooseImage}) async {
    if (isChooseImage == true) {
      final statusCamera = await Permission.camera.request();
      if (!statusCamera.isGranted) {
        emit(HomePageError());
      } else {
        ImagePicker imagePicker = ImagePicker();
        XFile? image = await imagePicker.pickImage(
            source: isChooseImage == true
                ? ImageSource.camera
                : ImageSource.gallery,
            imageQuality: null,
            preferredCameraDevice: CameraDevice.front);

        if (image != null) {
          emit(HomePageSuccess());
          imageFile = File(image.path);

        }
      }
    } else {
      final statusImage = await Permission.photos.request();
      final statusStorage = await Permission.storage.request();
      if (statusImage.isGranted || statusStorage.isGranted) {
        ImagePicker imagePicker = ImagePicker();
        XFile? image = await imagePicker.pickImage(
            source: isChooseImage == true
                ? ImageSource.camera
                : ImageSource.gallery,
            imageQuality: null,
            preferredCameraDevice: CameraDevice.front);
        if (image != null) {
          emit(HomePageSuccess());
          imageFile = File(image.path);
          return image.path;
        }
      } else {
        emit(HomePageError());
      }
    }
    return '';
  }
}
