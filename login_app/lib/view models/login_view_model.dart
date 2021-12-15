import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_app/routes/app_pages.dart';
import 'package:login_app/services/auth.dart';
import 'package:login_app/utils/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginViewModel extends ChangeNotifier with ValidationMixin {
   TextEditingController? emailController, passwordController;
  final box = GetStorage();
  bool loadingView = false;

  void initializeObject() {
    if(emailController==null)
    emailController = new TextEditingController();
    if(passwordController==null)
    passwordController = new TextEditingController();
  }

  checkLogin() async {
      if (validateEmail(emailController!.text) != null) {
        Get.snackbar("Error", "${validateEmail(emailController!.text)}");
        return;
      } else if (validatePassword(passwordController!.text) != null) {
        Get.snackbar("Error", "${validatePassword(passwordController!.text)}");
        return;
      } else {
        notifyLoader(true);
        await Auth()
            .handleSignInEmail(emailController!.text, passwordController!.text);
        notifyLoader(false);

        navigateToHomeView();
      }
  }

  notifyLoader(bool state) {
    loadingView = state;
    notifyListeners();
  }

  navigateToRegisterView() {
    Get.toNamed(Routes.REGISTER);
  }

  navigateToHomeView() {
    box.write('home', true);
    Get.offAllNamed(Routes.HOME);
  }
}
