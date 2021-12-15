import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_app/routes/app_pages.dart';
import 'package:login_app/services/auth.dart';
import 'package:login_app/utils/validator.dart';

class RegisterViewModel extends ChangeNotifier with ValidationMixin {
  late TextEditingController emailController, passwordController;
  final box = GetStorage();
  bool loadingView = false;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  void initializeObject() {
    emailController = new TextEditingController();
    passwordController = new TextEditingController();
  }

  checkLogin() async {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      if (validateEmail(emailController.text) != null) {
        Get.snackbar("Error", "${validateEmail(emailController.text)}");
        return;
      } else if (validatePassword(passwordController.text) != null) {
        Get.snackbar("Error", "${validatePassword(passwordController.text)}");
        return;
      } else {
        notifyLoader(true);
        await Auth()
            .handleSignUp(emailController.text, passwordController.text);
        notifyLoader(false);
        navigateToHomeView();
      }
    }
    loginFormKey.currentState!.save();
  }

  notifyLoader(bool state) {
    loadingView = state;
    notifyListeners();
  }

  navigateToLogin() {
    Get.toNamed(Routes.REGISTER);
  }

  navigateToHomeView() {
    box.write('home', true);
    Get.offAllNamed(Routes.HOME);
  }
}
