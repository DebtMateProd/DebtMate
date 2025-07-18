import 'package:flutter/material.dart';
import 'package:myapp/models/requests/register_request.dart';
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
              controller: loginController, 
              labelText: 'Login'),
            InputTextField(
            controller: passwordController, 
            labelText: 'Hasło',
            hideText: true,),
            InputTextField(
              controller: userNameController, 
              labelText: 'Nazwa użytkownika'),
            CustomButton(
              labelText: 'Zarejestruj się',
              onPressed: register,)
          ],
        ),
      ),
    );
  }
}
