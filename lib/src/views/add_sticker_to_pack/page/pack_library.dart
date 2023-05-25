// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sticker_maker/src/utils/style.dart';
import 'package:sticker_maker/src/views/add_sticker_to_pack/component/pack_sticker.dart';
import 'package:sticker_maker/src/views/views_index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PackLibrary extends StatelessWidget {
  PackLibrary({super.key});

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
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.only(bottom: 83),
                decoration: const BoxDecoration(color: Color(0xFFFF8A65)),
                child: SingleChildScrollView(
                  // child: Column(children: List.generate(6, (index) => PackSticker())),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      PackSticker(),
                      PackSticker(),
                      PackSticker(),
                      PackSticker(),
                      PackSticker(),
                      PackSticker(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
