// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sticker_maker/src/utils/utils_index.dart';
import 'package:sticker_maker/src/views/add_sticker_to_pack/component/custom_choose_sticker.dart';
import 'package:sticker_maker/src/views/add_sticker_to_pack/cubit/add_sticker_to_pack_cubit.dart';
import 'package:sticker_maker/src/views/add_sticker_to_pack/cubit/add_sticker_to_pack_state.dart';
import 'package:sticker_maker/src/views/add_sticker_to_pack/page/pack_library.dart';
import 'package:sticker_maker/src/views/views_index.dart';

class AddToPack extends StatefulWidget {
  AddToPack({super.key});

  @override
  State<AddToPack> createState() => _AddToPackState();
}

class _AddToPackState extends State<AddToPack> {
  bool showbtn = false;
  late AddStickerToPackCubit cubit;
  int countSelectedPack = 0;
  int selected = 0;
  @override
  void initState() {
    cubit = AddStickerToPackCubit();
    cubit.selectedpack == false;
    super.initState();
  }

  List<Map<String, dynamic>> listPack = [
    {"linkSticker": "assets/icons/cute_sticker.png", "title": "Cute", "status": false},
    {"linkSticker": "assets/icons/cute_sticker.png", "title": "Cute", "status": false},
    {"linkSticker": "assets/icons/cute_sticker.png", "title": "Cute", "status": false},
    {"linkSticker": "assets/icons/cute_sticker.png", "title": "Cute", "status": false},
    {"linkSticker": "assets/icons/cute_sticker.png", "title": "Cute", "status": false},
    {"linkSticker": "assets/icons/cute_sticker.png", "title": "Cute", "status": false},
    {"linkSticker": "assets/icons/cute_sticker.png", "title": "Cute", "status": false},
    {"linkSticker": "assets/icons/cute_sticker.png", "title": "Cute", "status": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => AddStickerToPackCubit(),
          child: BlocBuilder<AddStickerToPackCubit, AddStickerToPackState>(builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset('assets/icons/ic_backBtn.svg')),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ));
                          },
                          child: SvgPicture.asset("assets/icons/ic_home.svg"))
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 16),
                    width: 90,
                    height: 36,
                    decoration:
                        BoxDecoration(color: Color(0xFFFF8A65), borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
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
                          child: SvgPicture.asset("assets/icons/save_sticker.svg"),
                        ),
                        GestureDetector(
                          onTap: () {
                            final snackBar = SnackBar(
                              content: Text('Chưa có ảnh để thực hiện tính năng này (^.^)'),
                              action: SnackBarAction(
                                label: '',
                                onPressed: () {},
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                          child: SvgPicture.asset("assets/icons/share_btn.svg"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 28),
                Expanded(
                    child: Container(
                  child: Image.asset("assets/icons/ImgTemp.png"),
                )),
                SizedBox(height: 34),
                Container(
                  padding: const EdgeInsets.only(bottom: 81),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 23),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            AppLocalizations.of(context)!.your_sticker_packs,
                            style: AppStyle.DEFAUlT_12_CR,
                          ),
                        ),
                      ),
                      SizedBox(height: 14),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(children: [
                                Text(
                                  AppLocalizations.of(context)!.create_pack,
                                  style: AppStyle.DEFAUlT_CONTENT_TITLE_PACK_STICKER,
                                ),
                                SizedBox(height: 6),
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
                                    child: SvgPicture.asset(
                                      'assets/icons/create_pack.svg',
                                      width: 80,
                                      height: 80,
                                    ))
                              ]),
                            ),
                            Row(
                              children: List.generate(
                                  listPack.length,
                                  (index) => CustomChooseSticker(
                                        linkSticker: listPack[index]['linkSticker'],
                                        titlePack: listPack[index]["title"],
                                        status: listPack[index]['status'],
                                        update: () {
                                          listPack[index]['status'] = !listPack[index]['status'];
                                          if (listPack[index]['status'] == true) {
                                            countSelectedPack++;
                                          } else {
                                            countSelectedPack--;
                                          }
                                          setState(() {});
                                        },
                                      )),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 25),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: () {
                            countSelectedPack > 0
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PackLibrary(),
                                    ))
                                : null;
                          },
                          child: Container(
                            width: 164,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: countSelectedPack > 0
                                      ? [Color(0xFFDE225B), Color(0xFFE46D39)]
                                      : [Color(0xFFDE225B).withOpacity(0.3), Color(0xFFE46D39).withOpacity(0.3)]),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(AppLocalizations.of(context)!.add_to_pack, style: AppStyle.DEFAUlT_12),
                                SvgPicture.asset('assets/icons/ic_add.svg'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
