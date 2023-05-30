import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/color.dart';
import '../../../widgets/common/app_slider.dart';
import '../../../widgets/custom/custom.dart';

class AddDrawing extends StatefulWidget {
  final PainterController drawingController;
  final Function undo;
  final Function redo;

  const AddDrawing({
    Key? key,
    required this.drawingController,
    required this.undo,
    required this.redo,
  }) : super(key: key);

  @override
  State<AddDrawing> createState() => _AddDrawingState();
}

class _AddDrawingState extends State<AddDrawing> {
  Color _brushColor = brushColors[0];
  double _paintStroke = 20;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SvgPicture.asset('assets/icons/Size.svg'),
            AppSlider(
                onChanged: (v) {
                  setState(() {
                    _paintStroke = v;
                  });
                  widget.drawingController.freeStyleStrokeWidth = _paintStroke;
                },
                sliderValue: _paintStroke),
            GestureDetector(
              onTap: () {
                if (widget.drawingController.canUndo) {
                  widget.undo();
                }
                setState(() {});
              },
              child: SvgPicture.asset(
                  widget.drawingController.canUndo ? 'assets/icons/ic_undo.svg' : 'assets/icons/ic_undo_off.svg'),
            ),
            GestureDetector(
              onTap: () {
                if (widget.drawingController.canRedo) {
                  widget.redo();
                }
                setState(() {});
              },
              child: SvgPicture.asset(
                  widget.drawingController.canRedo ? 'assets/icons/ic_redo.svg' : 'assets/icons/ic_redo_off.svg'),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4),
            child: SizedBox(
                child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 6,
                children: brushColors.map(
                  (color) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _brushColor = color;
                        });
                        widget.drawingController.freeStyleColor = color;
                      },
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: color,
                            border: Border.all(color: _brushColor == color ? Colors.red : Colors.black)),
                        child: const SizedBox.shrink(),
                      ),
                    );
                  },
                ).toList(),
              ),
            )),
          ),
        ],
      ),
    );
  }
}
