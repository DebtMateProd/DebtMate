import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/models/responses/reckoning_debtors_response.dart';
import 'package:myapp/pages/debts_page.dart';

import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/profile_page.dart';
import 'package:myapp/pages/register_page.dart';
import 'package:myapp/pages/login_page.dart';
import 'package:myapp/pages/main_page.dart';
import 'package:myapp/pages/friends_page.dart';
import 'package:myapp/pages/friend_requests_page.dart';
import 'package:myapp/pages/add_friend_page.dart';
import 'package:myapp/pages/add_reckoning_page.dart';
import 'package:myapp/pages/reckonings_page.dart';
import 'package:myapp/pages/owed_reckonings_page.dart';
import 'package:myapp/pages/add_new_receipt.dart';
import 'package:myapp/pages/choose_reckoning_type_page.dart';
import 'package:myapp/pages/assign_receipt_page.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter({required bool loggedIn}) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(path: '/home', builder: (context, state) => const HomePage()),
      GoRoute(path: '/register', builder: (context, state) => const RegisterScreen()),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(path: '/main', builder: (context, state) => const MainPage()),

      GoRoute(path: '/friends', builder: (context, state) => const FriendsPage()),
      GoRoute(path: '/friendrequests', builder: (context, state) => const FriendRequestsPage()),
      GoRoute(path: '/addfriend', builder: (context, state) => const AddFriendPage()),

      GoRoute(
        path: '/addediteckoning', // lub '/edit-reckoning' zależnie jak masz nazwane
        builder: (context, state) {
          final reckoningToEdit = state.extra as ReckoningDebtorsResp?;
          
          return AddEditReckoningPage(reckoningToEdit: reckoningToEdit);
        },
      ),

      GoRoute(path: '/reckonings', builder: (context, state) => const ReckoningsPage()),
      GoRoute(path: '/owedReckonings', builder: (context, state) => const ReckoningsOwedPage()),

      GoRoute(
        path: '/balance',
        builder: (context, state) {
          final showDebts = state.extra as bool;
          return BalancePage(showDebts: showDebts);
        },
      ),

      GoRoute(path: '/addReceipt', builder: (context, state) => const AddReceiptPage()),
      GoRoute(path: '/chooseReckoningType', builder: (context, state) => const ReckoningTypePage()),
      GoRoute(path: '/profile', builder: (context, state) => const ProfilePage()),


      GoRoute(
        path: '/assignReceipt',
        builder: (context, state) {
          final products = state.extra as List<Product>;
          return ReceiptAssignPage(products: products);
        },
      ),

      GoRoute(
        path: '/',
        redirect: (context, state) => loggedIn ? '/main' : '/home',
      ),
    ],
  );
}
