import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/utils/routes.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return MaterialApp(
      title: 'DebtMate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      routes: appRoutes,
      home: const HomePage(),
    );
  }
}
