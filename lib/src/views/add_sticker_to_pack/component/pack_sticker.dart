// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sticker_maker/src/utils/style.dart';
import 'package:sticker_maker/src/views/add_sticker_to_pack/component/custom_sticker.dart';

class PackSticker extends StatelessWidget {
  PackSticker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 3, bottom: 8, top: 3),
      decoration:
          BoxDecoration(color: Color(0xFFFFFFFF).withOpacity(0.3), borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Column(
                  children: [
                    Text('Pet', style: AppStyle.DEFAUlT_CONTENT_TEXT_ADD_STICKER),
                    Text('4 sticker', style: AppStyle.DEFAUlT_CONTENT_TEXT_ADD_STICKER_SMALL)
                  ],
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        final snackBar = SnackBar(
                          content: const Text('ÚI !!! Chỉ có giao diện, tính năng e chưa được xử lí (^.^)'),
                          action: SnackBarAction(
                            label: '',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: SvgPicture.asset('assets/icons/delete_pack.svg')),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      final snackBar = SnackBar(
                        content: const Text('Chỉ có giao diện, tính năng e chưa được xử lí (^.^)'),
                        action: SnackBarAction(
                          label: '',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 9),
                      margin: EdgeInsets.only(right: 3),
                      decoration: BoxDecoration(
                          color: Color(0xFF57D071),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.4), blurRadius: 1, offset: Offset(1, 1.5))
                          ]),
                      child: Text(
                        'Share whatsapp',
                        style: AppStyle.DEFAUlT_CONTENT_TEXT_FEED_SOCIALMEDIA,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CustomSticker(link: "assets/icons/ImgTemp.png"),
                CustomSticker(link: "assets/icons/cute_sticker.png"),
                CustomSticker(link: "assets/icons/pet_sticker.png"),
                CustomSticker(link: "assets/icons/cute_sticker.png"),
                CustomSticker(link: "assets/icons/pet_sticker.png"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
