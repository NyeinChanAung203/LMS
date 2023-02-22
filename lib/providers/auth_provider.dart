import 'dart:developer';

import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/sign_in.dart';
import '../services/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SuccessToWhere { signIn, home }

class AuthProvider with ChangeNotifier {
  AuthProvider() {
    getCheck();
  }

  bool isLoading = false;
  bool checkBox = false;

  void toggleCheckBox() {
    checkBox = !checkBox;
    notifyListeners();
  }

  String? name;
  String? password;

  Future<void> getCheck() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    name = preferences.getString('name');
    password = preferences.getString('password');
    if (name != null && password != null) {
      checkBox = true;
    }
    print('name $name');
    print('pw $password');
  }

  void turnOnLoading() {
    isLoading = true;
    notifyListeners();
  }

  void turnOffLoading() {
    isLoading = false;
    notifyListeners();
  }

  void signUp(
      BuildContext context,
      GlobalKey<FormState> formKey,
      TextEditingController nameController,
      TextEditingController emailController,
      TextEditingController passwordController) async {
    turnOnLoading();
    if (formKey.currentState!.validate()) {
      await AuthService.signUp(nameController.text.trim(),
              emailController.text.trim(), passwordController.text.trim())
          .then((result) {
        showMessageSnackBar(context, result, 'Successfully created an account',
            "Failed to create an account", SuccessToWhere.signIn);
      });
    }
    turnOffLoading();
  }

  void signIn(
      BuildContext context,
      GlobalKey<FormState> formKey,
      TextEditingController emailController,
      TextEditingController passwordController) async {
    turnOnLoading();
    if (formKey.currentState!.validate()) {
      if (checkBox) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setString('name', emailController.text.trim());
        await preferences.setString('password', passwordController.text.trim());
      }
      await AuthService.signIn(
              emailController.text.trim(), passwordController.text.trim())
          .then((result) {
        showMessageSnackBar(
            context, result, 'Success', "Failed to login", SuccessToWhere.home);
      });
    }
    turnOffLoading();
  }

  void showMessageSnackBar(BuildContext context, bool condition,
      String successMessage, String failedMessage, SuccessToWhere toWhere) {
    if (condition == true) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(successMessage,
            style: const TextStyle(
              color: Colors.white,
            )),
        backgroundColor: Colors.green,
      ));
      if (toWhere == SuccessToWhere.signIn) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const SignInScreen()));
      } else if (toWhere == SuccessToWhere.home) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(failedMessage,
            style: const TextStyle(
              color: Colors.white,
            )),
        backgroundColor: Colors.red,
      ));
    }
  }
}
