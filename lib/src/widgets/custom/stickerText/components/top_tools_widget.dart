import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../extensions/context_extension.dart';
import '../models/editable_items.dart';

class TopToolsWidget extends StatelessWidget {
  final bool isTextInput;
  final Duration animationsDuration;
  final EditableItem? activeItem;

  final int selectedTextBackgroundGradientIndex;
  final VoidCallback onScreenTap;
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
    required this.onScreenTap,
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
    if (isTextInput) {
      return Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     TextButton(
          //         onPressed: onCancel,
          //         child: const Text(
          //           'Cancel',
          //           style: TextStyle(color: Colors.white),
          //         )),
          //     TextButton(
          //         onPressed: onDone,
          //         child: const Text(
          //           'Done',
          //           style: TextStyle(color: Colors.white),
          //         )),
          //   ],
          // ),
          Container(
            width: context.width,
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: onChangeTextFont,
                    child: !isChangeTextFont
                        ? SvgPicture.asset('assets/icons/ic_text_inactive.svg')
                        : SvgPicture.asset('assets/icons/ic_text_active.svg'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: onChangeTextFont,
                    child: !isAligntext
                        ? SvgPicture.asset('assets/icons/Align.svg')
                        : SvgPicture.asset('assets/icons/ic_text_active.svg'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: onChangeTextFont,
                    child: !isChangeColorText
                        ? SvgPicture.asset('assets/icons/ic_color_inactive.svg')
                        : SvgPicture.asset('assets/icons/ic_color_active.svg'),
                  ),
                ),
                GestureDetector(
                  onTap: onChangeTextFont,
                  child: !isChangeTextBackground
                      ? SvgPicture.asset('assets/icons/text_color.svg')
                      : SvgPicture.asset('assets/icons/ic_text_active.svg'),
                ),
              ],
            ),
          ),
        ],
      );
    }
    return const SizedBox();
  }
}
