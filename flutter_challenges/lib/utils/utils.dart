import 'package:flutter/material.dart';

abstract class Utils {
  Utils._();
  static void navigateTo(BuildContext context, Widget page, {bool fullscreenDialog = false}) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page, fullscreenDialog: fullscreenDialog));
  }

  static void navigateAndReplacementTo(BuildContext context, Widget page, {bool fullscreenDialog = false}) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => page, fullscreenDialog: fullscreenDialog));
  }

  static void navigateRemoveUntilTo(BuildContext context, Widget page) {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => page), (route) => false);
  }
}
