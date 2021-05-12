import 'package:flutter/material.dart';

abstract class Utils {
  Utils._();
  static Future navigateTo(BuildContext context, Widget page, {bool fullscreenDialog = false}) {
    return Navigator.of(context).push(MaterialPageRoute(builder: (_) => page, fullscreenDialog: fullscreenDialog));
  }

  static Future navigateAndReplacementTo(BuildContext context, Widget page, {bool fullscreenDialog = false}) {
    return Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => page, fullscreenDialog: fullscreenDialog));
  }

  static Future navigateRemoveUntilTo(BuildContext context, Widget page) {
    return Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => page), (route) => false);
  }
}
