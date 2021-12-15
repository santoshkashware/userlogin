import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_app/routes/app_pages.dart';
import 'package:login_app/utils/validator.dart';

class LoginViewModel extends ChangeNotifier with ValidationMixin {
  late TextEditingController emailController, passwordController;
  final box = GetStorage();

  void initializeObject() {
    emailController = new TextEditingController();
    passwordController = new TextEditingController();
  }

  checkLogin() {
    if (validateEmail(emailController.text) != null) {
      Get.snackbar("Error", "${validateEmail(emailController.text)}");
      return;
    } else if (validatePassword(passwordController.text) != null) {
      Get.snackbar("Error", "${validatePassword(passwordController.text)}");
      return;
    } else {
      String? emailValue = box.read('email');
      String? passwordValue = box.read('password');
      if (emailValue == emailController.text &&
          passwordValue == passwordController.text) {
        box.write('home', true);
        navigateToHomeView();
      } else {
        Get.snackbar("Error", "Please check email or password");
      }
    }
  }

  navigateToRegisterView() {
    Get.toNamed(Routes.REGISTER);
  }

  navigateToHomeView() {
    Get.offAllNamed(Routes.HOME);
  }
}
