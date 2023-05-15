import 'dart:ffi';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:ffi/ffi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sticker_maker/src/utils/utils_index.dart';
import 'package:sticker_maker/src/views/views_index.dart';
import 'package:sticker_maker/src/widgets/widgets_index.dart';

class PreEditPage extends StatefulWidget {
  final File? image;

  const PreEditPage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<PreEditPage> createState() => _PreEditPageState();
}

class _PreEditPageState extends State<PreEditPage> {
  String _functionLabel = '';
  late double screenWidth;
  late double screenHeight;
  Future<ui.Image> getImage(ui.Image oriImg, ui.Image maskImg, int imageWidth,
      int imageHeight) async {
    final ui.PictureRecorder recorder = ui.PictureRecorder();
    OverlayPainter painter = OverlayPainter(maskImg, oriImg);
    painter.paint(Canvas(recorder),
        ui.Size(imageWidth.toDouble(), imageHeight.toDouble()));
    final ui.Picture picture = recorder.endRecording();
    return await picture.toImage(imageWidth, imageHeight);
  }

  _removeImageBG(String imagePath) async {
    Loading.show(context);
    final tempDir = await getTemporaryDirectory();
    var imageByte = await File(imagePath).readAsBytes();
    var decodedImage = await decodeImageFromList(imageByte);

    int totalByteImage = decodedImage.width * decodedImage.height * 4;

    final Directory? extDir = await getExternalStorageDirectory();
    await Directory(extDir!.path).create(recursive: true);
    String outputPath = '${extDir.path}/cache.png';
    File cachedFile = File(outputPath);

    using((Arena arena) {
      Pointer<Uint8> ptr = arena<Uint8>(totalByteImage);
      final args = ProcessImageArguments(imagePath, ptr, decodedImage.width,
          decodedImage.height, cachedFile.path);

      makeProcessImage(args);
    });
    Uint8List maskBytes = await cachedFile.readAsBytes();
    var decodeMask = await decodeImageFromList(maskBytes);
    if (await cachedFile.exists()) {
      await cachedFile.delete();
    }
    ui.Image picture = await getImage(
        decodedImage, decodeMask, decodedImage.width, decodedImage.height);
    final pictureData = await picture.toByteData(
      format: ui.ImageByteFormat.png,
    );
    Uint8List pictureBytes = pictureData!.buffer.asUint8List();
    File outFile =
        File("${tempDir.path}/${DateTime.now().microsecondsSinceEpoch}.png");
    outFile.writeAsBytesSync(pictureBytes);
    Loading.hide(context);
    // ignore: use_build_context_synchronously
    AppNavigate.navigatePage(context, EditScreen(image: outFile.path));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFCECECE),
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.89,
              margin: const EdgeInsets.only(top: 30, right: 10, left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          AppNavigate.replacePage(context, const HomePage());
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 10, left: 10),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFDE225B),
                                Color(0xFFE46D39),
                              ],
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white),
                            child: Center(
                              child:
                                  SvgPicture.asset('assets/icons/ic_back.svg'),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        _functionLabel,
                        style: AppStyle.DEFAULT_16.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(top: 10, right: 10),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xFF36CF00)),
                        child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: Center(
                            child: SvgPicture.asset('assets/icons/ic_save.svg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      // color: Colors.blue,
                      image: DecorationImage(
                        image:
                            AssetImage('assets/images/img_transparent_bgr.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.67,
                    width: double.infinity,
                    child: Center(
                      child: Image.file(File(widget.image!.path)),
                    ),
                  )
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(left: 25, right: 25, bottom: 55),
              width: double.infinity,
              height: 42,
              child: CurvedButtonBar(
                buttonBackgroundColor: Colors.white,
                height: 42,
                letIndexChange: (index) => true,
                backgroundColor: Colors.transparent,
                color: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
                onTap: (index) {
                  switch (index) {
                    case 0:
                      setState(() {
                        _functionLabel = 'Remove Background';
                      });
                      _removeImageBG(widget.image!.path);
                      break;
                    case 1:
                      setState(() {
                        _functionLabel = 'Cut';
                      });
                      break;
                    default:
                      setState(() {
                        _functionLabel = 'abc';
                      });
                  }
                },
                items: const [
                  Icon(
                    Icons.home,
                    color: Color(0xFFDE225B),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Color(0xFFDE225B),
                  ),
                  Icon(
                    Icons.settings,
                    color: Color(0xFFDE225B),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
