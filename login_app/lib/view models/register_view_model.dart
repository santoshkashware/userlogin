import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_app/routes/app_pages.dart';
import 'package:login_app/services/auth.dart';
import 'package:login_app/utils/validator.dart';

class RegisterViewModel extends ChangeNotifier with ValidationMixin {
  TextEditingController? emailController, passwordController;
  final box = GetStorage();
  bool loadingView = false;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  void initializeObject() {
    if (emailController == null) emailController = new TextEditingController();
    if (passwordController == null)
      passwordController = new TextEditingController();
  }

  checkLogin() async {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      if (validateEmail(emailController!.text) != null) {
        Get.snackbar("Error", "${validateEmail(emailController!.text)}");
        return;
      } else if (validatePassword(passwordController!.text) != null) {
        Get.snackbar("Error", "${validatePassword(passwordController!.text)}");
        return;
      } else {
        notifyLoader(true);
        await Auth()
            .handleSignUp(emailController!.text, passwordController!.text)
            .then((user) {
          navigateToHomeView();
        }).catchError((e) {
          Get.snackbar("Error", "${e}");
        });
        notifyLoader(false);
      }
    }
    loginFormKey.currentState!.save();
  }

  notifyLoader(bool state) {
    loadingView = state;
    notifyListeners();
  }

  navigateToLogin() {
    Get.toNamed(Routes.LOGIN);
  }

  navigateToHomeView() {
    box.write('home', true);
    Get.offAllNamed(Routes.HOME);
  }
  hideKeyBoard(BuildContext context){
    FocusScope.of(context).unfocus();
  }
}
