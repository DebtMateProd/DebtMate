import 'package:flutter/material.dart';
import 'package:myapp/utils/toast.dart';
import 'package:myapp/widgets/button.dart';
import 'package:myapp/utils/route_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String title = "DebtMate";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.cyan,
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: Colors.white),
            onPressed: () => _showInfoDialog(),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  spacing: 10,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Image.asset(
                        'images/logo.png',
                      ),
                    ),
                    Text(
                      'Witaj w DebtMate!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 15,
                    children: [
                      CustomButton(
                        labelText: 'Zaloguj',
                        onPressed: () {
                          showToast("Przechodzenie do logowania...");
                          RouteHelper.getTo('/login');
                        },
                      ),
                      CustomButton(
                        labelText: 'Zarejestruj',
                        onPressed: () {
                          showToast("Przechodzenie do rejestracji...");
                          RouteHelper.getTo('/register');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showInfoDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Informacje', style: TextStyle(color: Colors.white)),
          content: Text('DebtMate to aplikacja do rozliczania znajomych z wspólnych wydatków. Dodaj znajomego i sprawdź 😎.', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.cyan,
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
