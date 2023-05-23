import 'package:flutter/material.dart';

class Loading {
  const Loading._();
  static Future<dynamic> show(BuildContext context, String notiMess) {
    return showDialog(
        useSafeArea: false,
        barrierColor: Colors.transparent,
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return _LoadingWidget(
            notiMess: notiMess,
          );
        });
  }

  static void hide(BuildContext context) {
    Navigator.pop(context);
  }
}

class _LoadingWidget extends StatelessWidget {
  final String notiMess;
  const _LoadingWidget({super.key, required this.notiMess});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black.withOpacity(0.4),
          child: Center(
            child: Image.asset(
              'assets/images/loading.gif',
              height: 83,
              width: 83,
            ),
          ),
        ));
  }
}
