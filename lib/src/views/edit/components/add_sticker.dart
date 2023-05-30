import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  List<Map<String, dynamic>> typeSticker = [
    {
      "title": "Beard",
      "icon_on": "assets/icons/sticker/ic_board_on.svg",
      "icon_off": "assets/icons/sticker/ic_board_off.svg"
    },
    {
      "title": "Hat",
      "icon_on": "assets/icons/sticker/ic_hat_on.svg",
      "icon_off": "assets/icons/sticker/ic_hat_off.svg"
    },
    {
      "title": "Glasses",
      "icon_on": "assets/icons/sticker/ic_glasses_on.svg",
      "icon_off": "assets/icons/sticker/ic_glasses_off.svg",
    },
    {
      "title": "Talking",
      "icon_on": "assets/icons/sticker/ic_talking_on.svg",
      "icon_off": "assets/icons/sticker/ic_talking_off.svg"
    },
    {
      "title": "Other",
      "icon_on": "assets/icons/sticker/ic_other_on.svg",
      "icon_off": "assets/icons/sticker/ic_other_off.svg"
    },
  ];

  int indexSelect = 0;

  List<String> listSticker = [];

  @override
  void initState() {
    listSticker = listBeard;
    super.initState();
  }

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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          typeSticker.length,
                          (index) => select_type_sticker(
                                title: typeSticker[index]['title'],
                                icon_on: typeSticker[index]['icon_on'],
                                icon_off: typeSticker[index]['icon_off'],
                                indexSelect: indexSelect,
                                index: index,
                                onClick: () {
                                  setState(() {
                                    indexSelect = index;
                                    if (indexSelect == 0) {
                                      listSticker = listBeard;
                                    } else {
                                      if (indexSelect == 1) {
                                        listSticker = listHat;
                                      } else {
                                        if (indexSelect == 2) {
                                          listSticker = listGlasses;
                                        } else {
                                          if (indexSelect == 3) {
                                            listSticker = listTalking;
                                          } else {
                                            listSticker = listOther;
                                          }
                                        }
                                      }
                                    }
                                  });
                                },
                              )),
                    ),
                  ),
                  AppValue.vSpaceTiny,
                  Container(
                    width: AppValue.widths,
                    height: AppValue.heights * 0.4,
                    padding: const EdgeInsets.only(bottom: 5),
                    child: GridView(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, crossAxisSpacing: 15, mainAxisSpacing: 15),
                        children: List.generate(
                          listSticker.length,
                          (index) => GestureDetector(
                              onTap: () {
                                widget.stackData.add(EditableItem()
                                  ..type = ItemType.IMAGE
                                  ..image = listSticker[index]);
                                widget.update(widget.stackData);
                              },
                              child: Image.asset(listSticker[index])),
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

class select_type_sticker extends StatefulWidget {
  final String title;
  final String icon_on;
  final String icon_off;
  final int index;
  final int indexSelect;
  final Function onClick;

  const select_type_sticker({
    super.key,
    required this.title,
    required this.index,
    required this.indexSelect,
    required this.icon_on,
    required this.icon_off,
    required this.onClick,
  });

  @override
  State<select_type_sticker> createState() => _select_type_stickerState();
}

class _select_type_stickerState extends State<select_type_sticker> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onClick();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
            SizedBox(
              height: 35,
              width: 35,
              child: SvgPicture.asset(
                (widget.index == widget.indexSelect) ? widget.icon_on : widget.icon_off,
                height: 35,
                width: 35,
              ),
            ),
            AppValue.vSpace(3),
            Text(
              widget.title,
              style: AppStyle.DEFAULT_12
                  .copyWith(color: const Color(0xffffffff).withOpacity((widget.index == widget.indexSelect) ? 1 : 0.7)),
            )
          ],
        ),
      ),
    );
  }
}
