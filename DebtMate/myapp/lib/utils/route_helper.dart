import 'package:flutter/material.dart';

class RouteHelper {
  static void getTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  static void getToReplace(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  static void getBack(BuildContext context) {
    Navigator.pop(context);
  }
}