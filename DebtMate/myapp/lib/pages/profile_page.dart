import 'package:flutter/material.dart';
import 'package:myapp/controllers/user_controller.dart';
import 'package:myapp/models/requests/update_user_request.dart';
import 'package:myapp/models/responses/user_response.dart';
import 'package:myapp/repositories/user_repository.dart';
import 'package:myapp/utils/api_service.dart';
import 'package:myapp/widgets/button.dart';
import 'package:myapp/widgets/text_field.dart';
import 'package:myapp/utils/toast.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final userNameController = TextEditingController();

  final UserController userController = UserController(UserRepository());

  bool isEditingProfile = false;
  bool isChangingPassword = false;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    if (ApiService.instance.userId == null) return;

    UserResp? user = await userController.getUserLoginDataById(ApiService.instance.userId!);
    if (user != null) {
      setState(() {
        loginController.text = user.userLogin ?? "";
        userNameController.text = user.username;
      });
    } else {
      showToast("Nie udało się załadować danych użytkownika.");
    }
  }

  void updateProfile() async {
    final login = loginController.text.trim();
    final password = passwordController.text.trim();
    final username = userNameController.text.trim();

    final req = UpdateUserReq(
      userId: ApiService.instance.userId!,
      login: login,
      password: password.isEmpty ? null : password,
      username: username,
    );

    bool success = await userController.updateUserData(req);

    if (success) {
      showToast("Zaktualizowano profil!");

      setState(() {
        loadUserData();
        handleCancel();
      });
      
    } else {
      showToast("Nie udało się zaktualizować profilu.");
    }
  }

  void validateAndUpdate() {
    final login = loginController.text.trim();
    final password = passwordController.text.trim();
    final username = userNameController.text.trim();
    final passwordConfirm = passwordConfirmController.text.trim();

    if (login.isEmpty) {
      showToast("Podaj login.");
      return;
    }

    if (username.isEmpty) {
      showToast("Podaj nazwę użytkownika.");
      return;
    }

    final anyPasswordFieldTyped = password.isNotEmpty || passwordConfirm.isNotEmpty;

    if (anyPasswordFieldTyped) {
      if (password.isEmpty || passwordConfirm.isEmpty) {
        showToast("Uzupełnij oba pola hasła.");
        return;
      }

      if (password != passwordConfirm) {
        showToast("Hasła nie są takie same.");
        return;
      }
    }

    updateProfile();
  }

  void handleEditProfile() {
    setState(() {
      isEditingProfile = true;
      isChangingPassword = false;
      passwordController.clear();
      passwordConfirmController.clear();
    });
  }

  void handleChangePassword() {
    setState(() {
      isEditingProfile = false;
      isChangingPassword = true;
      passwordController.clear();
      passwordConfirmController.clear();
    });
  }

  void handleCancel() {
    setState(() {
      isEditingProfile = false;
      isChangingPassword = false;
      passwordController.clear();
      passwordConfirmController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Twój profil', style: TextStyle(color: Colors.white)),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    labelText: 'Edytuj profil',
                    onPressed: handleEditProfile,
                  ),
                  const SizedBox(width: 10),
                  CustomButton(
                    labelText: 'Zmień hasło',
                    onPressed: handleChangePassword,
                  ),
                ],
              ),
              if (isEditingProfile) ...[
                Column(
                  spacing: 10,
                  children: [
                    InputTextField(
                      controller: loginController,
                      labelText: 'Login',
                    ),
                    InputTextField(
                      controller: userNameController,
                      labelText: 'Nazwa użytkownika',
                    ),
                  ],
                ),
                Column(
                  spacing: 10,
                  children: [
                    CustomButton(
                      labelText: 'Zapisz zmiany',
                      onPressed: validateAndUpdate,
                    ),
                    CustomButton(
                      labelText: 'Anuluj',
                      onPressed: handleCancel,
                    ),
                  ],
                ),  
              ] else if (isChangingPassword) ...[
                Column(
                  spacing: 10,
                  children: [
                    InputTextField(
                      controller: passwordController,
                      labelText: 'Nowe hasło',
                      hideText: true,
                    ),
                    InputTextField(
                      controller: passwordConfirmController,
                      labelText: 'Powtórz hasło',
                      hideText: true,
                    ),
                  ],
                ),
                Column(
                  spacing: 10,
                  children: [
                    CustomButton(
                      labelText: 'Zapisz hasło',
                      onPressed: validateAndUpdate,
                    ),
                    CustomButton(
                      labelText: 'Anuluj',
                      onPressed: handleCancel,
                    ),
                  ],
                ),
              ] else ...[
                Column(
                  spacing: 10,
                  children: [
                    InputTextField(
                      controller: loginController,
                      labelText: 'Login',
                      readOnly: true,
                    ),
                    InputTextField(
                      controller: userNameController,
                      labelText: 'Nazwa użytkownika',
                      readOnly: true,
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}