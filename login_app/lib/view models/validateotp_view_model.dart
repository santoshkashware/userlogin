import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_app/routes/app_pages.dart';
import 'package:login_app/utils/validator.dart';

class ValidateOtpViewModel extends ChangeNotifier with ValidationMixin {
  TextEditingController? otpController1,
      otpController2,
      otpController3,
      otpController4;
  final box = GetStorage();

  void initializeObject() {
    if (otpController1 == null) otpController1 = new TextEditingController();
    if (otpController2 == null) otpController2 = new TextEditingController();
    if (otpController3 == null) otpController3 = new TextEditingController();
    if (otpController4 == null) otpController4 = new TextEditingController();
  }

  validateOtp() {
    if (validateString(otpController1!.text) != null ||
        validateString(otpController2!.text) != null ||
        validateString(otpController3!.text) != null ||
        validateString(otpController4!.text) != null) {
      showErrorView(message: "${validateString(otpController4!.text)}");
      return;
    } else {
      String value =
          "${otpController1!.text}${otpController2!.text}${otpController3!.text}${otpController4!.text}";
      if (value.contains("1234") || value == "1234") {
        navigateToHomeView();
      } else {
        showErrorView(message: "Incorrect Otp");
      }
    }
  }

  navigateToHomeView() {
    box.write('home', true);
    Get.offAllNamed(Routes.HOME);
  }
}
