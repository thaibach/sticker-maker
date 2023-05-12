import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonIcon extends StatelessWidget {
  final Function() onClick;
  final String iconImage;
  final int btnWidth;
  final int btnHeight;
  const ButtonIcon(
      {Key? key,
      required this.onClick,
      required this.iconImage,
      required this.btnWidth,
      required this.btnHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: SvgPicture.asset(
        iconImage,
        width: btnWidth.toDouble(),
        height: btnHeight.toDouble(),
      ),
    );
  }
}
