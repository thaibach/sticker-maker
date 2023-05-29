import 'package:flutter/material.dart';

import '../../../utils/utils_index.dart';
import '../../../widgets/custom/custom.dart';

class AddStickerWidget extends StatefulWidget {
  final List<EditableItem> stackData;
  final Function update;
  final Function pop;
  const AddStickerWidget({Key? key, required this.stackData, required this.update, required this.pop})
      : super(key: key);

  @override
  State<AddStickerWidget> createState() => _AddStickerWidgetState();
}

class _AddStickerWidgetState extends State<AddStickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
          onTap: () {
            widget.pop();
          },
          child: Container(
            height: AppValue.heights,
            width: AppValue.widths,
            color: Colors.black.withOpacity(0.1),
          ),
        ),
        Positioned(
          bottom: AppValue.heights * 0.16,
          right: 0,
          left: 0,
          child: Container(
            width: AppValue.widths,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration:
                BoxDecoration(color: const Color(0xff000000).withOpacity(0.5), borderRadius: BorderRadius.circular(10)),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose an icon',
                    style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  AppValue.vSpaceTiny,
                  Container(
                    width: AppValue.widths,
                    height: AppValue.heights * 0.42,
                    padding: const EdgeInsets.only(bottom: 5),
                    child: GridView(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, crossAxisSpacing: 20, mainAxisSpacing: 20),
                        children: List.generate(
                          listBeard.length,
                          (index) => GestureDetector(
                              onTap: () {
                                print(listBeard[index]);
                                widget.stackData.add(EditableItem()
                                  ..type = ItemType.IMAGE
                                  ..image = listBeard[index]);
                                widget.update(widget.stackData);
                              },
                              child: Image.asset(listBeard[index])),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<String> listBeard = [
    "assets/icons/sticker/board/1.png",
    "assets/icons/sticker/board/2.png",
    "assets/icons/sticker/board/3.png",
    "assets/icons/sticker/board/4.png",
    "assets/icons/sticker/board/5.png",
    "assets/icons/sticker/board/6.png",
    "assets/icons/sticker/board/7.png",
  ];

  List<String> listGlasses = [
    "assets/icons/sticker/glasses/1.png",
    "assets/icons/sticker/glasses/2.png",
    "assets/icons/sticker/glasses/3.png",
    "assets/icons/sticker/glasses/4.png",
    "assets/icons/sticker/glasses/5.png",
    "assets/icons/sticker/glasses/6.png",
    "assets/icons/sticker/glasses/7.png",
    "assets/icons/sticker/glasses/8.png",
    "assets/icons/sticker/glasses/9.png",
  ];

  List<String> listHat = [
    "assets/icons/sticker/hat/1.png",
    "assets/icons/sticker/hat/2.png",
    "assets/icons/sticker/hat/3.png",
    "assets/icons/sticker/hat/4.png",
    "assets/icons/sticker/hat/5.png",
    "assets/icons/sticker/hat/6.png",
    "assets/icons/sticker/hat/7.png",
    "assets/icons/sticker/hat/8.png",
    "assets/icons/sticker/hat/9.png",
  ];

  List<String> listOther = [
    "assets/icons/sticker/other/1.png",
    "assets/icons/sticker/other/2.png",
    "assets/icons/sticker/other/3.png",
    "assets/icons/sticker/other/4.png",
    "assets/icons/sticker/other/5.png",
    "assets/icons/sticker/other/6.png",
    "assets/icons/sticker/other/7.png",
    "assets/icons/sticker/other/8.png",
    "assets/icons/sticker/other/9.png",
  ];

  List<String> listTalking = [
    "assets/icons/sticker/talking/1.png",
    "assets/icons/sticker/talking/2.png",
    "assets/icons/sticker/talking/3.png",
    "assets/icons/sticker/talking/4.png",
    "assets/icons/sticker/talking/5.png",
    "assets/icons/sticker/talking/6.png",
    "assets/icons/sticker/talking/7.png",
  ];
}
