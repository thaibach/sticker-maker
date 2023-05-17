import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sticker_maker/src/cubit/pre_edit_cubit/pre_edit_cubit.dart';

class PreEditComponents {
  final File? image;

  PreEditComponents(this.preEditCubit, this.image,);

  final PreEditCubit preEditCubit;

  Widget preEditCustomBar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.89,
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(colors: [
          Color(0xFFDE225B),
          Color(0xFFE46D39),
        ]),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              preEditCubit.changeCuverBottomBar();
              // preEditCubit.removeImageBG(image!.path);
            },
            child: SvgPicture.asset(customBottomBar[0].image),
          ),
          GestureDetector(
            onTap: () {
              // preEditCubit.changeCuverBottomBar();
            },
            child: SvgPicture.asset(customBottomBar[1].image),
          ),
          GestureDetector(
            onTap: () {
              //  preEditCubit.changeCuverBottomBar();
            },
            child: SvgPicture.asset(customBottomBar[2].image),
          ),
        ],
      ),
    );
  }
}

class CustomBottomBar {
  final int id;
  final String image;
  CustomBottomBar({required this.id, required this.image});
}

 List<CustomBottomBar> customBottomBar = [
  CustomBottomBar(id: 0, image: 'assets/icons/ic_removeBgr.svg'),
  CustomBottomBar(id: 1, image: 'assets/icons/ic_cut.svg'),
  CustomBottomBar(id: 2, image: 'assets/icons/ic_crop.svg'),
];
