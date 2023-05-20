import 'package:flutter/material.dart';

import '../extensions/context_extension.dart';

class SizeSliderWidget extends StatelessWidget {
  final Duration animationsDuration;
  final double selectedValue;
  final Function(double value) onChanged;

  const SizeSliderWidget({
    Key? key,
    required this.animationsDuration,
    required this.onChanged,
    required this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: animationsDuration,
      top: context.height * .5 - 160,
      right: -100,
      child: Transform(
        alignment: FractionalOffset.center,
        // Rotate sliders by 90 degrees
        transform: Matrix4.identity()..rotateZ(270 * 3.1415927 / 180),
        child: SizedBox(
          width: 248,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbColor: Colors.red,
              inactiveTrackColor: Color.fromRGBO(217, 217, 217, 1),
              trackHeight: 4.0,
              activeTrackColor: const Color(0x00ffffff).withOpacity(0.9),
              valueIndicatorColor: Colors.red,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
              inactiveTickMarkColor: Colors.grey,
            ),
            child: Slider(
              value: selectedValue,
              min: 14,
              max: 84,
              inactiveColor: Colors.white.withOpacity(0.4),
              onChanged: onChanged,
            ),
          ),
        ),
      ),
    );
  }
}
