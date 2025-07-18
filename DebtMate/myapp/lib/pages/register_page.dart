import 'package:flutter/material.dart';
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
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  late final AuthController _authController;

  @override
  void initState() {
    super.initState();
    _authController = AuthController(AuthRepository());
  }

  void register() async {
    final success = await _authController.register(
      _loginController.text,
      _passwordController.text,
    );

    if (success) {
      showToast("successful");
    } else {
      showToast("unsuccessful");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rejestracja')),
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
              labelText: 'Zarejestruj się',
              onPressed: register,)
          ],
        ),
      ),
    );
  }
}
