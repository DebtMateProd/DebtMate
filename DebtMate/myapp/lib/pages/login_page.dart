import 'package:flutter/material.dart';
import 'package:myapp/models/requests/login_request.dart';
import 'package:myapp/utils/api_service.dart';
import 'package:myapp/utils/route_helper.dart';
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

  Future<bool> login() async {
    final success = await _authController.login(LoginReq(
      login: _loginController.text, 
      password: _passwordController.text)
    );

    if (success.token != '' ) {
      ApiService.instance.userId = success.userId;
      ApiService.instance.token = success.token;
      return true;

    } else {
      return false;
    }
  }

  void handleLogin() async {
    bool success = await login();

    if(success){
      RouteHelper.getTo('/main');
    }else{
      showToast("Logowanie nie powiodło się. Sprawdź dane i spróbuj ponownie.");
    }
  }

  void validateAndLogin() {
    final login = _loginController.text.trim();
    final password = _passwordController.text.trim();

    if (login.isEmpty) {
      showToast("Podaj login.");
      return;
    }

    if (password.isEmpty) {
      showToast("Podaj hasło.");
      return;
    }

    handleLogin(); // jeśli walidacja przejdzie, wykonujemy logowanie
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logowanie', style:  TextStyle(color: Colors.white),),
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
          padding: const EdgeInsets.all(24),
          child: Column(
            spacing: 20,
            children: [
              Column(
                spacing: 10,
                children: [
                  InputTextField(
                    controller: _loginController, 
                    labelText: 'Login'),
                  InputTextField(
                    controller: _passwordController, 
                    labelText: 'Hasło',
                    hideText: true,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        labelText: 'Zaloguj się',
                        onPressed: () {
                          validateAndLogin();
                        }
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
