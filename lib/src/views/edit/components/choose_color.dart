import 'package:flutter/material.dart';

class ChooseColor extends StatelessWidget {
  // final Function(int i) onChangeColor;
  final List<Color> listColor;
  final Color selectedColor;
  const ChooseColor(
      {super.key,
      // required this.onChangeColor,
      required this.listColor,
      required this.selectedColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listColor.length,
        itemBuilder: (BuildContext ctx, int index) {
          return GestureDetector(
            // onTap: onChangeColor(index),
            child: Container(
              color: listColor[index],
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                    color: listColor[index] == selectedColor
                        ? Colors.red
                        : Colors.transparent),
              ),
            ),
          );
        },
      ),
    );
  }
}
