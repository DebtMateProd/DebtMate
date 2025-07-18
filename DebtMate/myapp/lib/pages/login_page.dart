import 'package:flutter/material.dart';
import 'package:myapp/models/requests/login_request.dart';
import 'package:myapp/widgets/button.dart';
import 'package:myapp/widgets/text_field.dart';
import 'package:myapp/utils/toast.dart';
import '../controllers/auth_controller.dart';
import '../repositories/auth_repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  late final AuthController _authController;

  @override
  void initState() {
    super.initState();
    _authController = AuthController(AuthRepository());
  }

  void login() async {
    final success = await _authController.login(LoginReq(
      login: _loginController.text, 
      password: _passwordController.text)
    );

    if (success.token != '' ) {
      showToast("successful");
    } else {
      showToast("unsuccessful");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Logowanie')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InputTextField(
              controller: _loginController, 
              labelText: 'Login'),
            InputTextField(
            controller: _passwordController, 
            labelText: 'Hasło',
            hideText: true,),
            CustomButton(
              labelText: 'Zaloguj się',
              onPressed: login,)
          ],
        ),
      ),
    );
  }
}
