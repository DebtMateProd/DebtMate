import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/utils/navigator_key.dart';
import 'package:myapp/utils/routes.dart';
import 'package:toast/toast.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return MaterialApp(
      title: 'DebtMate',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      routes: appRoutes,
      home: const HomePage(),
    );
  }
}
