// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sticker_maker/src/utils/utils_index.dart';

class CustomChooseSticker extends StatelessWidget {
  const CustomChooseSticker(
      {super.key, required this.linkSticker, required this.titlePack, required this.status, required this.update});
  final String linkSticker;
  final String titlePack;
  final bool status;
  final Function update;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        update();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Text(
              titlePack,
              style: AppStyle.DEFAUlT_CONTENT_TITLE_PACK_STICKER,
            ),
            SizedBox(height: 6),
            Stack(
              children: [
                Image.asset(
                  linkSticker,
                  width: 80,
                  height: 80,
                ),
                Positioned(
                    bottom: 10,
                    right: 0,
                    child: SvgPicture.asset(
                      status == false
                          ? 'assets/icons/ic_unticked_pack.svg'
                          : 'assets/icons/ic_ticked_pack.svg',
                      width: 20,
                      height: 20,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
