import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/login_page.dart';
import 'package:myapp/pages/register_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/home': (context) => const HomePage(),
  '/register': (context) => const RegisterScreen(),
  '/login': (context) => const LoginScreen(),
};
