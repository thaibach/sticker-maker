import 'package:flutter/material.dart';

class AppSlider extends StatelessWidget {
  final Function(double value) onChanged;
  final double sliderValue;

  const AppSlider(
      {Key? key, required this.onChanged, required this.sliderValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          thumbColor: Colors.white,
          inactiveTrackColor: const Color(0x008572ff),
          trackHeight: 3.0,
          activeTrackColor: const Color.fromRGBO(133, 114, 255, 1),
          valueIndicatorColor: Colors.red,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
          inactiveTickMarkColor: Colors.grey,
        ),
        child: Slider(
          value: sliderValue,
          min: 10,
          max: 100,
          inactiveColor: const Color(0xFFD9D9D9),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
