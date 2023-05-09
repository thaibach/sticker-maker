import 'package:flutter/material.dart';

class AppNavigate {
  static Future pushAndRemoveUtilPage(BuildContext context, Widget widget) {
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget),
        (Route<dynamic> route) => false);
  }

  static Future pushAndRemoveUtilKeepFirstPage(
      BuildContext context, Widget widget) {
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget),
        ModalRoute.withName(Navigator.defaultRouteName));
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

  static Future rootNavigatePage(BuildContext context, Widget widget) {
    return rootNavigatePageWithName(
        context, widget, widget.runtimeType.toString());
  }

  static Future rootNavigatePageWithName(
      BuildContext context, Widget widget, String pageName) {
    return Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(name: pageName, arguments: Map())));
  }
}
