import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

import '../../widgets/custom/custom.dart';
import 'edit_state.dart';

class EditPageCubit extends Cubit<EditPageState> {
  EditPageCubit() : super(EditPageInit());

  List<EditableItem> stackData = <EditableItem>[];

  saveImage(Uint8List bytes, String name) async {
    final Directory? extDir = await getExternalStorageDirectory();
    String dirPath = '${extDir!.path}/Documents/pictures';
    dirPath = dirPath.replaceAll("Android/data/com.intes.sticker_maker/files/", "");
    await Directory(dirPath).create(recursive: true);
    String outputPath = '$dirPath/$name.png';
    File imageFile = File(outputPath);
    imageFile.writeAsBytesSync(bytes, flush: true, mode: FileMode.writeOnlyAppend);
    emit(EditPageSuccess(image: bytes));
  }
}
