import 'package:flutter/material.dart';

import '../../../utils/utils_index.dart';
import '../../../widgets/custom/custom.dart';

class AddEmojiWidget extends StatefulWidget {
  final List<EditableItem> stackData;
  final Function update;
  final Function pop;
  const AddEmojiWidget({super.key, required this.stackData, required this.update, required this.pop});

  @override
  State<AddEmojiWidget> createState() => _AddEmojiWidgetState();
}

class _AddEmojiWidgetState extends State<AddEmojiWidget> {
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
                  Scrollbar(
                    child: Container(
                      width: AppValue.widths,
                      height: AppValue.heights * 0.224,
                      padding: const EdgeInsets.only(bottom: 5),
                      child: GridView(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, crossAxisSpacing: 13, mainAxisSpacing: 12),
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            listEmoji.length,
                            (index) => GestureDetector(
                                onTap: () {
                                  print(listEmoji[index]);
                                  widget.stackData.add(EditableItem()
                                    ..type = ItemType.IMAGE
                                    ..image = listEmoji[index]);
                                  widget.update(widget.stackData);
                                },
                                child: Image.asset(listEmoji[index])),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<String> listEmoji = [
    'assets/icons/emoji/Frame 52.png',
    'assets/icons/emoji/Frame 53.png',
    'assets/icons/emoji/Frame 54.png',
    'assets/icons/emoji/Frame 55.png',
    'assets/icons/emoji/Frame 56.png',
    'assets/icons/emoji/Frame 57.png',
    'assets/icons/emoji/Frame 58.png',
    'assets/icons/emoji/Frame 59.png',
    'assets/icons/emoji/Frame 60.png',
    'assets/icons/emoji/Frame 61.png',
    'assets/icons/emoji/Frame 62.png',
    'assets/icons/emoji/Frame 63.png',
    'assets/icons/emoji/Frame 64.png',
    'assets/icons/emoji/Frame 65.png',
    'assets/icons/emoji/Frame 66.png',
    'assets/icons/emoji/Frame 67.png',
    'assets/icons/emoji/Frame 68.png',
    'assets/icons/emoji/Frame 69.png',
    'assets/icons/emoji/Frame 70.png',
    'assets/icons/emoji/Frame 71.png',
    'assets/icons/emoji/Frame 72.png',
    'assets/icons/emoji/Frame 73.png',
    'assets/icons/emoji/Frame 74.png',
    'assets/icons/emoji/Frame 75.png',
    'assets/icons/emoji/Frame 76.png',
    'assets/icons/emoji/Frame 77.png',
    'assets/icons/emoji/Frame 78.png',
    'assets/icons/emoji/Frame 79.png',
    'assets/icons/emoji/Frame 80.png',
    'assets/icons/emoji/Frame 81.png',
    'assets/icons/emoji/Frame 82.png',
    'assets/icons/emoji/Frame 83.png',
    'assets/icons/emoji/Frame 84.png',
    'assets/icons/emoji/Frame 85.png',
    'assets/icons/emoji/Frame 86.png',
    'assets/icons/emoji/Frame 87.png',
    'assets/icons/emoji/Frame 88.png',
    'assets/icons/emoji/Frame 89.png',
    'assets/icons/emoji/Frame 90.png',
    'assets/icons/emoji/Frame 91.png',
    'assets/icons/emoji/Frame 92.png',
    'assets/icons/emoji/Frame 93.png',
    'assets/icons/emoji/Frame 94.png',
    'assets/icons/emoji/Frame 95.png',
    'assets/icons/emoji/Frame 96.png',
    'assets/icons/emoji/Frame 97.png',
    'assets/icons/emoji/Frame 98.png',
    'assets/icons/emoji/Frame 99.png',
    'assets/icons/emoji/Frame 100.png',
    'assets/icons/emoji/Frame 101.png',
    'assets/icons/emoji/Frame 102.png',
    'assets/icons/emoji/Frame 103.png',
    'assets/icons/emoji/Frame 104.png',
    'assets/icons/emoji/Frame 105.png',
    'assets/icons/emoji/Frame 107.png',
  ];
}
