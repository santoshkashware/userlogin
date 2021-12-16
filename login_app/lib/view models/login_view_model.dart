import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_app/routes/app_pages.dart';
import 'package:login_app/services/auth.dart';
import 'package:login_app/services/firebaseauth.dart';
import 'package:login_app/utils/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginViewModel extends ChangeNotifier with ValidationMixin {
  TextEditingController? emailController, passwordController;
  final box = GetStorage();
  bool loadingView = false;

  void initializeObject() {
    if (emailController == null) emailController = new TextEditingController();
    if (passwordController == null)
      passwordController = new TextEditingController();
  }

  checkLogin() async {
    if (validateEmail(emailController!.text) != null) {
      showErrorView(message: "${validateEmail(emailController!.text)}");
      return;
    } else if (validatePassword(passwordController!.text) != null) {
      showErrorView(message: "${validatePassword(passwordController!.text)}");
      return;
    } else {
      notifyLoader(true);
      await FirebaseData().handleUserData(emailController!.text).then((user) {
        if (user.email != null) {
          if (emailController!.text == user.email &&
              passwordController!.text == user.password) {
            navigateToHomeView();
          } else {}
        } else {
          print('data is null');
        }
      }).catchError((e) {
        showErrorView(message: e);
      });
      notifyLoader(false);
    }
  }

  notifyLoader(bool state) {
    loadingView = state;
    notifyListeners();
  }

  navigateToRegisterView() async {
    Get.toNamed(Routes.REGISTER);
  }

  navigateToHomeView() {
    box.write('home', true);
    Get.offAllNamed(Routes.HOME);
  }

  hideKeyBoard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
