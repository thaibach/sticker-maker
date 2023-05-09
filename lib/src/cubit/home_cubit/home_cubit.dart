import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sticker_maker/src/cubit/home_cubit/home_state.dart';

class HomePageCubit extends Cubit<HomePageState>{
 HomePageCubit() : super(HomePageLoading());

 File? imageFile;

 //lấy ảnh cần chỉnh sửa từ thư viện ảnh
 Future<String> getFromGallery({bool? isChooseImage}) async {
  if (isChooseImage == true) {
   final statusCamera = await Permission.camera.request();
   if (!statusCamera.isGranted) {
    emit(HomePageError());
   } else {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(
        source: isChooseImage == true ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front);
    imageFile = File(image?.path ?? "");
    emit(HomePageSuccess(status: true));
    return image?.path ?? "";
   }
  } else {
   final statusImage = await Permission.photos.request();
   final statusStorage = await Permission.storage.request();
   if (statusImage.isGranted || statusStorage.isGranted) {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(
        source: isChooseImage == true ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front);
    imageFile = File(image?.path ?? "");
    emit(HomePageSuccess(status: true));
    return image?.path ?? "";
   } else {
    emit(HomePageError());
   }
  }
  return '';
 }

}