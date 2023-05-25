import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final double position;
  final int length;
  final int index;
  final ValueChanged<int> onTap;
  final Widget child;
  final bool unSelect;

  NavButton(
      {required this.onTap,
      required this.position,
      required this.length,
      required this.index,
      required this.child,
      required this.unSelect});

  @override
  Widget build(BuildContext context) {
    final desiredPosition = 1.0 / length * index;
    final difference = (position - desiredPosition).abs();
    final verticalAlignment = 1 - length * difference;
    final opacity = length * difference;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          onTap(index);
        },
        child: SizedBox(
            height: 42.0,
            child: Transform.translate(
              offset: Offset(0, unSelect ? (difference < 1.0 / length ? verticalAlignment * 40 : 0) : 0),
              child:
                  Opacity(opacity: unSelect ? (difference < 1.0 / length * 0.99 ? opacity : 1.0) : 1.0, child: child),
            )),
      ),
    );
  }
}
