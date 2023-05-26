import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../extensions/context_extension.dart';
import '../models/editable_items.dart';

class RemoveWidget extends StatelessWidget {
  const RemoveWidget({
    Key? key,
    required this.isTextInput,
    required EditableItem? activeItem,
    required this.isDeletePosition,
    required this.animationsDuration,
  })  : _activeItem = activeItem,
        super(key: key);

  final bool isTextInput;
  final EditableItem? _activeItem;
  final bool isDeletePosition;
  final Duration animationsDuration;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !isTextInput,
      child: Positioned(
        bottom: context.bottomPadding + 10,
        child: AnimatedSwitcher(
          duration: animationsDuration,
          child: _activeItem == null
              ? const SizedBox()
              : AnimatedSize(
                  duration: animationsDuration,
                  child: SizedBox(
                    width: context.width,
                    child: Center(
                      child: AnimatedContainer(
                          duration: animationsDuration,
                          height: !isDeletePosition ? 42.0 : 55,
                          width: !isDeletePosition ? 42.0 : 55,
                          child: isDeletePosition
                              ? SvgPicture.asset('assets/icons/bin_open.svg')
                              : SvgPicture.asset('assets/icons/bin_close.svg')),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
