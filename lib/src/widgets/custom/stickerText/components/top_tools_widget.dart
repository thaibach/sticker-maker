import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sticker_maker/src/widgets/custom/custom.dart';

class TopToolsWidget extends StatelessWidget {
  final bool isTextInput;
  final Duration animationsDuration;
  final EditableItem? activeItem;

  final int selectedTextBackgroundGradientIndex;

  final VoidCallback onCancel;
  final VoidCallback onDone;
  final VoidCallback onToggleTextColorPicker;
  final VoidCallback onChangeTextBackground;
  final VoidCallback onChangeTextFont;
  final bool isChangeTextFont;
  final bool isAligntext;
  final bool isChangeColorText;
  final bool isChangeTextBackground;
  const TopToolsWidget({
    Key? key,
    required this.isTextInput,
    required this.animationsDuration,
    this.selectedTextBackgroundGradientIndex = 0,
    required this.onToggleTextColorPicker,
    required this.onChangeTextBackground,
    this.activeItem,
    required this.onCancel,
    required this.onDone,
    required this.onChangeTextFont,
    required this.isChangeTextFont,
    required this.isAligntext,
    required this.isChangeColorText,
    required this.isChangeTextBackground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.topPadding,
      width: context.width,
      child: Column(
        children: [
          SizedBox(
            width: context.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onCancel,
                  child: Container(
                    margin: const EdgeInsets.only(left: 16, top: 8),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: onDone,
                    child: Container(
                      margin: const EdgeInsets.only(right: 16, top: 8),
                      child: const Text(
                        'Done',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ],
            ),
          ),
          Container(
            width: context.width,
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onChangeTextFont,
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: !isChangeTextFont
                        ? SvgPicture.asset('assets/icons/ic_text_inactive.svg')
                        : SvgPicture.asset('assets/icons/ic_text_active.svg'),
                  ),
                ),
                GestureDetector(
                  onTap: onChangeTextFont,
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: !isAligntext
                        ? SvgPicture.asset('assets/icons/align_right.svg')
                        : SvgPicture.asset('assets/icons/ic_text_active.svg'),
                  ),
                ),
                GestureDetector(
                  onTap: onToggleTextColorPicker,
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: !isChangeColorText
                        ? SvgPicture.asset('assets/icons/ic_color_inactive.svg')
                        : SvgPicture.asset('assets/icons/ic_color_active.svg'),
                  ),
                ),
                GestureDetector(
                  onTap: onChangeTextBackground,
                  child: isChangeTextBackground
                      ? SvgPicture.asset('assets/icons/text_color.svg')
                      : SvgPicture.asset(
                          'assets/icons/text_color_inactive.svg'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
