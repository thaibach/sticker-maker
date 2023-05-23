import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'import_buttom_bar.dart';

typedef _LetIndexPage = bool Function(int value);

class CurvedNavigationBar extends StatefulWidget {
  bool unSelect;
  final List<String> items;
  final int index;
  final Color color;
  final Color? buttonBackgroundColor;
  final Color backgroundColor;
  final ValueChanged<int>? onTap;
  final _LetIndexPage letIndexChange;
  final Curve animationCurve;
  final Duration animationDuration;
  final double height;
  final double width;
  Function click;

  CurvedNavigationBar({
    Key? key,
    required this.click,
    required this.unSelect,
    required this.items,
    this.index = 0,
    this.color = Colors.white,
    this.buttonBackgroundColor,
    this.backgroundColor = Colors.blueAccent,
    this.onTap,
    _LetIndexPage? letIndexChange,
    this.animationCurve = Curves.easeOut,
    this.animationDuration = const Duration(milliseconds: 600),
    required this.height,
    required this.width,
  })  : letIndexChange = letIndexChange ?? ((_) => true),
        assert(items != null),
        assert(items.length >= 1),
        assert(0 <= index && index < items.length),
        assert(0 <= height && height <= 75.0),
        super(key: key);

  @override
  CurvedNavigationBarState createState() => CurvedNavigationBarState();
}

class CurvedNavigationBarState extends State<CurvedNavigationBar> with SingleTickerProviderStateMixin {
  late double _startingPos;
  int _endingIndex = 0;
  late double _pos;
  double _buttonHide = 0;
  late Widget _icon;
  late AnimationController _animationController;
  late int _length;

  @override
  void initState() {
    super.initState();
    _icon = SvgPicture.asset(widget.items[widget.index], color: const Color(0xFFDE225B));
    _length = widget.items.length;
    _pos = widget.index / _length;
    _startingPos = widget.index / _length;
    _animationController = AnimationController(vsync: this, value: _pos);
    _animationController.addListener(() {
      setState(() {
        _pos = _animationController.value;
        final endingPos = _endingIndex / widget.items.length;
        final middle = (endingPos + _startingPos) / 2;
        if ((endingPos - _pos).abs() < (_startingPos - _pos).abs()) {
          _icon = SvgPicture.asset(widget.items[_endingIndex], color: const Color(0xFFDE225B));
        }
        _buttonHide = (1 - ((middle - _pos) / (_startingPos - middle)).abs()).abs();
      });
    });
  }

  @override
  void didUpdateWidget(CurvedNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      final newPosition = widget.index / _length;
      _startingPos = _pos;
      _endingIndex = widget.index;
      _animationController.animateTo(newPosition, duration: widget.animationDuration, curve: widget.animationCurve);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(
      color: widget.backgroundColor,
      height: widget.height,
      width: widget.width,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          widget.unSelect
              ? Positioned(
                  bottom: -40 - (75.0 - widget.height),
                  left: Directionality.of(context) == TextDirection.rtl ? null : _pos * widget.width,
                  right: Directionality.of(context) == TextDirection.rtl ? _pos * widget.width : null,
                  width: widget.width / _length,
                  child: Center(
                    child: Transform.translate(
                      offset: Offset(
                        0,
                        -(1 - _buttonHide) * 65,
                      ),
                      child: Material(
                        color: widget.buttonBackgroundColor ?? widget.color,
                        type: MaterialType.circle,
                        clipBehavior: Clip.none,
                        child: Container(
                          height: 42,
                          width: 42,
                          padding: const EdgeInsets.all(2),
                          decoration:
                              BoxDecoration(color: const Color(0xFFE35C40), borderRadius: BorderRadius.circular(25)),
                          child: Container(
                            height: 42,
                            width: 42,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
                            child: Center(child: _icon),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0 - (75.0 - widget.height),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: widget.unSelect
                  ? CustomPaint(
                      painter: NavCustomPainter(_pos, _length, widget.color, Directionality.of(context)),
                      child: Container(
                        height: 42.0,
                      ),
                    )
                  : Container(
                      height: 42,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFFDE225B),
                          Color(0xFFE46D39),
                        ],
                      )),
                    ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0 - (75.0 - widget.height),
            child: SizedBox(
                // height: 100.0,
                width: widget.width * 0.85,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                      children: List.generate(
                          widget.items.length,
                          (index) => NavButton(
                                unSelect: widget.unSelect,
                                onTap: _buttonTap,
                                position: _pos,
                                length: _length,
                                index: widget.items.indexOf(widget.items[index]),
                                child: Center(child: SvgPicture.asset(widget.items[index])),
                              ))),
                )),
          ),
        ],
      ),
    );
  }

  void setPage(int index) {
    _buttonTap(index);
  }

  void _buttonTap(int index) {
    // if (widget.unSelect) {
    widget.click(true);
    if (!widget.letIndexChange(index)) {
      return;
    }
    if (widget.onTap != null) {
      widget.onTap!(index);
    }
    final newPosition = index / _length;
    setState(() {
      _startingPos = _pos;
      _endingIndex = index;
      _animationController.animateTo(newPosition, duration: widget.animationDuration, curve: widget.animationCurve);
    });
    // } else {
    //
    // }
  }
}
