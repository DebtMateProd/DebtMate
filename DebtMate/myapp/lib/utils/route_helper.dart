import 'package:myapp/utils/navigator_key.dart';

class RouteHelper {
  static void getTo(String routeName) {
    navigatorKey.currentState?.pushNamed(routeName);
  }

  static void getBack() {
    navigatorKey.currentState?.pop();
  }

  static void popUntilHome() {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      '/home',
      (route) => false,
    );
  }

  static void popUntilMain() {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      '/main',
      (route) => false,
    );
  }

  static void getToWithArgs(String routeName, Object args) {
    navigatorKey.currentState?.pushNamed(routeName, arguments: args);
  }
}