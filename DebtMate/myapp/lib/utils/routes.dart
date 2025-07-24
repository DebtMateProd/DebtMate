import 'package:flutter/material.dart';
import 'package:myapp/pages/add_friend_page.dart';
import 'package:myapp/pages/friend_requests_page.dart';
import 'package:myapp/pages/friends_page.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/login_page.dart';
import 'package:myapp/pages/main_page.dart';
import 'package:myapp/pages/register_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/home': (context) => const HomePage(),
  '/register': (context) => const RegisterScreen(),
  '/login': (context) => const LoginScreen(),
  '/main': (context) => const MainPage(),
  '/addfriend': (context) => const AddFriendPage(),
  '/friendrequests': (context) => const FriendRequestsPage(),
  '/friends': (context) => const FriendsPage(),
};
