import 'package:flutter/material.dart';
import 'package:myapp/models/requests/register_request.dart';
import 'package:myapp/utils/route_helper.dart';
import 'package:myapp/widgets/button.dart';
import 'package:myapp/widgets/text_field.dart';
import 'package:myapp/utils/toast.dart';
import '../controllers/auth_controller.dart';
import '../repositories/auth_repository.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();

  late final AuthController _authController;

  @override
  void initState() {
    super.initState();
    _authController = AuthController(AuthRepository());
  }

  void register() async {
    final success = await _authController.register(
      RegisterReq(login: loginController.text, password: passwordController.text, userName: userNameController.text)
    );

    if (success) {
      showToast("Udało się zarejestrować!");
      RouteHelper.popUntilHome();
    } else {
      showToast("Nie udało się zarejestrować. Sprawdź dane i spróbuj ponownie.");
    }
  }

  void validateAndRegister() {
    final login = loginController.text.trim();
    final password = passwordController.text.trim();
    final username = userNameController.text.trim();

    if (login.isEmpty) {
      showToast("Podaj login.");
      return;
    }

    if (password.isEmpty) {
      showToast("Podaj hasło.");
      return;
    }

    if (username.isEmpty) {
      showToast("Podaj nazwę użytkownika.");
      return;
    }

    register(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rejestracja', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.cyan,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 20,
            children: [
              Column(
                spacing: 10,
                children: [
                  InputTextField(
                    controller: loginController, 
                    labelText: 'Login'),
                  InputTextField(
                    controller: passwordController, 
                    labelText: 'Hasło',
                    hideText: true,),
                  InputTextField(
                    controller: userNameController, 
                    labelText: 'Nazwa użytkownika'),
                ],
              ),
              CustomButton(
                labelText: 'Zarejestruj się',
                onPressed: validateAndRegister,)
            ],
          ),
        ),
      ),
    );
  }
}
