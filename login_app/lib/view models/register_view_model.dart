import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_app/models/usermodel_object.dart';
import 'package:login_app/routes/app_pages.dart';
import 'package:login_app/services/firebase_db.dart';
import 'package:login_app/services/firebaseauth.dart';
import 'package:login_app/utils/validator.dart';

class RegisterViewModel extends ChangeNotifier with ValidationMixin {
  TextEditingController? emailController,
      passwordController,
      fNameController,
      lNameController,
      genderController,
      dobController,
      mobileController;
  final box = GetStorage();
  bool loadingView = false;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  String genderValue = 'one';
  var defaultGender = Gender.Male;

  void initializeObject() {
    if (emailController == null) emailController = new TextEditingController();
    if (passwordController == null)
      passwordController = new TextEditingController();
    if (fNameController == null) fNameController = new TextEditingController();
    if (lNameController == null) lNameController = new TextEditingController();
    if (mobileController == null)
      mobileController = new TextEditingController();
    if (genderController == null)
      genderController = new TextEditingController();
    if (dobController == null) dobController = new TextEditingController();
  }

  checkRegister() async {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      if (validateName(fNameController!.text) != null) {
        showErrorView(message: "${validateName(fNameController!.text)}");
        return;
      } else if (validateName(lNameController!.text) != null) {
        showErrorView(message: "${validateName(lNameController!.text)}");
        return;
      } else if (validateMobile(mobileController!.text) != null) {
        showErrorView(message: "${validateMobile(mobileController!.text)}");
        return;
      } else if (validateDob(dobController!.text) != null) {
        showErrorView(message: "${validateDob(dobController!.text)}");
        return;
      } else if (validateEmail(emailController!.text) != null) {
        showErrorView(message: "${validateEmail(emailController!.text)}");
        return;
      } else if (validatePassword(passwordController!.text) != null) {
        showErrorView(message: "${validatePassword(passwordController!.text)}");
        return;
      } else {
        notifyLoader(true);

        var data = new UserModelObject(
            fName: fNameController!.text,
            lName: lNameController!.text,
            mobile: mobileController!.text,
            email: emailController!.text,
            gender: defaultGender == Gender.Male
                ? "Male"
                : defaultGender == Gender.Male
                    ? "Female"
                    : "Other",
            dob: dobController!.text,
            password: passwordController!.text);
        await FirebaseDB()
            .handleRegister(emailController!.text, data)
            .then((user) {
          if (user) {
             navigateToOtp();
          }
        }).catchError((e) {
          print('e.toString() ${e.toString()}');
          showErrorView(message: e.toString());
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
    Get.offAllNamed(Routes.LOGIN);
  }

  navigateToHomeView() {
    box.write('home', true);
    Get.offAllNamed(Routes.HOME);
  }

  navigateToOtp() {
    box.write('home', true);
    box.write('email', emailController!.text);
    Get.offAllNamed(Routes.HOME);
  }

  hideKeyBoard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  updateGender(val) {
    defaultGender = val;
    notifyListeners();
  }
}
