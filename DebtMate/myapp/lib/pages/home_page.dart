import 'package:flutter/material.dart';
import 'package:myapp/widgets/button.dart';
import 'package:toast/toast.dart';
import 'package:myapp/utils/route_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String title = "Home";

  @override
  void initState() {
    super.initState();
    // Delay init until after build context is fully available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ToastContext().init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                labelText: 'Zaloguj',
                onPressed: () {
                  Toast.show("Przechodzenie do logowania...", duration: Toast.lengthShort);
                  RouteHelper.getTo(context, '/login');
                },
              ),
              CustomButton(
                labelText: 'Zarejestruj',
                onPressed: () {
                  Toast.show("Przechodzenie do rejestracji...", duration: Toast.lengthShort);
                  RouteHelper.getTo(context, '/register');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
