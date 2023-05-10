import 'dart:ffi'; // For FFI
import 'dart:io'; // For Platform.isX

import 'package:ffi/ffi.dart';

// C function signatures
typedef _init_model = Int8 Function(Pointer<Utf8>, Int32, Int32, Int32);
typedef _process_img_func = Void Function(
    Pointer<Utf8>, Pointer<Uint8>, Int32, Int32, Pointer<Utf8>);
typedef _process_cam_img_func = Void Function(Pointer<Uint8>, Pointer<Uint8>,
    Pointer<Uint8>, Pointer<Uint8>, Int32, Int32, Int32, Int32, Int32, Int32);
typedef _save_bg_removed_image = Bool Function(
    Pointer<Utf8>, Pointer<Utf8>, Pointer<Uint8>, Int32, Int32);
typedef _release_model = Void Function();

// Dart function signatures
typedef _InitModelFunc = int Function(Pointer<Utf8>, int, int, int);
typedef _ProcessImgFunc = void Function(
    Pointer<Utf8>, Pointer<Uint8>, int, int, Pointer<Utf8>);
typedef _ProcessCamImgFunc = void Function(Pointer<Uint8>, Pointer<Uint8>,
    Pointer<Uint8>, Pointer<Uint8>, int, int, int, int, int, int);
typedef _SaveBgRemovedImage = bool Function(
    Pointer<Utf8>, Pointer<Utf8>, Pointer<Uint8>, int, int);
typedef _ReleaseModelFunc = void Function();

// Getting a library that holds needed symbols
DynamicLibrary _lib_removebg = Platform.isAndroid
    ? DynamicLibrary.open("libremovebg.so")
    : DynamicLibrary.process();

// Looking for the functions
final _InitModelFunc _initModelFunc = _lib_removebg
    .lookup<NativeFunction<_init_model>>('init_model')
    .asFunction();

final _ProcessImgFunc _processImgFunc = _lib_removebg
    .lookup<NativeFunction<_process_img_func>>('make_process_image')
    .asFunction();

final _ProcessCamImgFunc _processCamImgFunc = _lib_removebg
    .lookup<NativeFunction<_process_cam_img_func>>('make_process_camera_image')
    .asFunction();

final _SaveBgRemovedImage _saveBgRemovedImage = _lib_removebg
    .lookup<NativeFunction<_save_bg_removed_image>>('save_bg_removed_image')
    .asFunction();

final _ReleaseModelFunc _releaseModelFunc = _lib_removebg
    .lookup<NativeFunction<_release_model>>('release_model')
    .asFunction();

void initModel(InitModelArguments args) {
  int isInitModel_ = _initModelFunc(args.modelPath.toNativeUtf8(),
      args.inputWidth, args.inputHeight, args.numMNNThreads);
  if (isInitModel_ == 0) {
    throw ("\n\n\nFail to init all model\n\n\n");
  }
}

class InitModelArguments {
  final String modelPath;
  final int inputWidth;
  final int inputHeight;
  final int numMNNThreads;

  InitModelArguments(
      this.modelPath, this.inputWidth, this.inputHeight, this.numMNNThreads);
}

makeProcessImage(ProcessImageArguments args) {
  _processImgFunc(args.inputImagePath.toNativeUtf8(), args.ptr,
      args.chosenWidth, args.chosenHeight, args.cachePath.toNativeUtf8());
}

class ProcessImageArguments {
  final String inputImagePath;
  final Pointer<Uint8> ptr;
  final int chosenWidth;
  final int chosenHeight;
  final String cachePath;

  ProcessImageArguments(this.inputImagePath, this.ptr, this.chosenWidth,
      this.chosenHeight, this.cachePath);
}

void makeProcessCameraImage(ProcessCameraImageArguments args) {
  _processCamImgFunc(
      args.imgPtr,
      args.channelY,
      args.channelU,
      args.channelV,
      args.numBytesPerRow,
      args.numBytesPerPixel,
      args.oriImgWidth,
      args.oriImgHeight,
      args.chosenWidth,
      args.chosenHeight);
}

class ProcessCameraImageArguments {
  final Pointer<Uint8> imgPtr;
  final Pointer<Uint8> channelY;
  final Pointer<Uint8> channelU;
  final Pointer<Uint8> channelV;
  final int numBytesPerRow;
  final int numBytesPerPixel;
  final int oriImgWidth;
  final int oriImgHeight;
  final int chosenWidth;
  final int chosenHeight;

  ProcessCameraImageArguments(
      this.imgPtr,
      this.channelY,
      this.channelU,
      this.channelV,
      this.numBytesPerRow,
      this.numBytesPerPixel,
      this.oriImgWidth,
      this.oriImgHeight,
      this.chosenWidth,
      this.chosenHeight);
}

bool saveBgRemovedImage(String oriImagePath, String outputPath,
    Pointer<Uint8> maskPtr, int chosenWidth, int chosenHeight) {
  return _saveBgRemovedImage(oriImagePath.toNativeUtf8(),
      outputPath.toNativeUtf8(), maskPtr, chosenWidth, chosenHeight);
}

void releaseModel() {
  _releaseModelFunc();
}
