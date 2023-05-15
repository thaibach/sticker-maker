import 'package:flutter/material.dart';

class AppNavigate {
  static Future pushAndRemoveUtilPage(BuildContext context, Widget widget) {
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget),
        (Route<dynamic> route) => false);
  }
  static void popToFirst(BuildContext context) {
    return Navigator.of(context)
        .popUntil((Route<dynamic> route) => route.isFirst);
  }

  static void pop(BuildContext context, {dynamic result}) {
    return Navigator.of(context).pop(result);
  }

  static Future replacePage(BuildContext context, Widget widget) {
    return Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => widget));
  }

  static Future navigatePage(BuildContext context, Widget widget) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => widget));
  }
}
