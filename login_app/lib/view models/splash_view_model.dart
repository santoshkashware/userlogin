import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_app/routes/app_pages.dart';

class SplashViewModel extends ChangeNotifier {
  final box = GetStorage();

  checkUser(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      bool userExist = box.read('home') ?? false;
      if (userExist) {
        //TODO Show User dashboard
        navigateTo(Routes.HOME);
      } else {
        // TODO Show Login
        navigateTo(Routes.LOGIN);
      }
    });
  }

  navigateTo(String routesName) {
    Get.offAllNamed(routesName);
  }

}
