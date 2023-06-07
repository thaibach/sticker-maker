// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sticker_maker/src/utils/style.dart';
import 'package:sticker_maker/src/views/pack_sticker/component/pack_sticker.dart';
import 'package:sticker_maker/src/views/pack_sticker/cubit/add_sticker_to_pack_cubit.dart';
import 'package:sticker_maker/src/views/views_index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PackLibraryPage extends StatefulWidget {
  PackLibraryPage({super.key, required this.addPackCubit});
  final AddStickerToPackCubit addPackCubit;

  @override
  State<PackLibraryPage> createState() => _PackLibraryPageState();
}

class _PackLibraryPageState extends State<PackLibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                      },
                      child: SvgPicture.asset("assets/icons/ic_home.svg"),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppLocalizations.of(context)!.packs_lib,
                        style: AppStyle.DEFAUlT_TITLE_SAVE_STICKER,
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox())
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                margin: EdgeInsets.only(bottom: 83),
                decoration: const BoxDecoration(color: Color(0xFFFF8A65)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      PackStickerCover(stickCubit: widget.addPackCubit),
                      PackStickerCover(stickCubit: widget.addPackCubit),
                      PackStickerCover(stickCubit: widget.addPackCubit),
                      PackStickerCover(stickCubit: widget.addPackCubit),
                      PackStickerCover(stickCubit: widget.addPackCubit),
                      PackStickerCover(stickCubit: widget.addPackCubit),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
