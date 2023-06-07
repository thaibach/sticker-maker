// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:sticker_maker/src/utils/utils_index.dart';
import 'package:sticker_maker/src/views/pack_sticker/cubit/add_sticker_to_pack_cubit.dart';

class PopUpAddNewPack extends StatelessWidget {
  const PopUpAddNewPack({super.key, required this.cubit});
  final AddStickerToPackCubit cubit;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: Text(
        AppLocalizations.of(context)!.enter_new_pack_name,
        style: AppStyle.DEFAUlT_CONTENT,
        textAlign: TextAlign.center,
      ),
      content: TextField(),
      actions: [
        OutlineGradientButton(
          padding: EdgeInsets.symmetric(horizontal: 39, vertical: 8),
          radius: Radius.circular(20),
          strokeWidth: 1,
          gradient: LinearGradient(
            colors: const [Color(0xFFFF28B6), Color(0xFF5060F5), Color(0xFF5060F5)],
            begin: Alignment.topLeft,
          ),
          child: Text(
            AppLocalizations.of(context)!.create_pack,
            style: TextStyle(fontFamily: 'Nunito', fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xff5060B8)),
          ),
          onTap: () {
            cubit.createPack();
          },
        )
      ],
    );
  }
}
