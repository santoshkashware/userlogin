import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:intl/intl.dart';

mixin ValidationMixin {
  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Please enter email";
    } else if (!GetUtils.isEmail(value)) {
      return "Provide valid email";
    } else {
      return null;
    }
  }

  String? validateName(String value) {
    String regx = "[a-zA-Z]+\\.?";
    RegExp _regExp = new RegExp(regx);
    if (value.isEmpty) {
      return "Please enter name";
    } else if (!_regExp.hasMatch(value))
      return "Name should be contain only alphabet";
    else {
      return null;
    }
  }

  String? validateMobile(String value) {
    print('value lenfght ${value.length}');
    if (value.isEmpty) {
      return "Please enter name";
    } else if (value.length < 12) {
      return "Password must be of 10 digits";
    } else {
      return null;
    }
  }

  String? validateDob(String value) {
    if (value.isEmpty) {
      return "Please enter date of birth";
    } else if (value.length < 10) {
      return "Provide valid date of birth";
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp _regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return "Please enter password";
    } else if (value.length < 8) {
      return "Password must be of 8 characters";
    } else if (!_regExp.hasMatch(value))
      return "Password should be like this Santosh@1234";
    else
      return null;
  }
  showErrorView({required String message}) {
    Get.snackbar("Error", "$message}");
  }
}
