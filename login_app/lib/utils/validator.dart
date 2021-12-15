import 'package:get/get_utils/src/get_utils/get_utils.dart';

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
    if (value.isEmpty) {
      return "Please enter name";
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
}