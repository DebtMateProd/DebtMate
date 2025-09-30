import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/utils/app_router.dart';

class RouteHelper {
  static void getTo(BuildContext context, String routeName) {
    context.push(routeName);
  }

  static void getBack(BuildContext context) {
    context.pop();
  }

  static void goToHomeSetRoot(BuildContext context) {
    context.go('/home');
  }

  static void goToMainSetRoot(BuildContext context) {
    context.go('/main');
  }

  static void getToWithArgs(BuildContext context, String routeName, Object args) {
    context.push(routeName, extra: args);
  }

  static void globalGo(String routeName, {Object? extra}) {
    rootNavigatorKey.currentContext?.go(routeName, extra: extra);
  }
}
