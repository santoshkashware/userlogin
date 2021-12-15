

import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_app/routes/app_pages.dart';

class SplashViewModel extends ChangeNotifier {
  final box = GetStorage();
  checkUser(BuildContext context) {

    const threeMillis = Duration(seconds: 3);
    Timer(threeMillis, () {
      bool userExist = box.read('userExist')?? false;
       if(userExist){
         //TODO Show User dashboard
       }else{
         // TODO Show Login
         navigateTo(Routes.LOGIN);

       }
    });
  }
  navigateTo(String routesName) {
    Get.offAllNamed(routesName);
  }

  sendToScreen(BuildContext context, String navigationName) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        navigationName, (Route<dynamic> route) => false);
    notifyListeners();
  }

}