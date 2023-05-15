import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Loading {
  const Loading._();
  static Future<dynamic> show(BuildContext context, {Future<void> Function()? backButton}) {
    return showDialog(
        useSafeArea: false,
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return _LoadingWidget(
            backButton: backButton,
          );
        });
  }

  static void hide(BuildContext context) {
    Navigator.pop(context);
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({this.backButton});

  final Future<void> Function()? backButton;
  static double dx = 0;

  Future<bool> _onWillPop() async {
    if (backButton is Function) {
      await backButton!();
      return true;
    }
    return false;
  }

  _onHorizontalDragStart(DragStartDetails details) {
    dx = details.localPosition.dx;
  }

  _onHorizontalDragEnd(DragEndDetails details) async {
    if ((backButton is Function) &&
        (dx < 30) &&
        (details.primaryVelocity != null) &&
        (details.primaryVelocity! > 200)) {
      dx = 0;
      await backButton!();
    }
    dx = 0;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: GestureDetector(
          onHorizontalDragStart: _onHorizontalDragStart,
          onHorizontalDragEnd: _onHorizontalDragEnd,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black.withOpacity(0.4),
            child:  Center(
              child: Image.asset(
                'assets/images/loading.gif',
                height: 83,
                width: 83,
              ),
            ),
          ),
        ));
  }
}
