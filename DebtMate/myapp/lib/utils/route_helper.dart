import 'package:myapp/utils/navigator_key.dart';

class RouteHelper {
  static void getTo(String routeName) {
    navigatorKey.currentState?.pushNamed(routeName);
  }

  static void getBack() {
    navigatorKey.currentState?.pop();
  }
}