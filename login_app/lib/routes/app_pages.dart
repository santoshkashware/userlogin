import 'package:get/get.dart';
import 'package:login_app/pages/home_page.dart';
import 'package:login_app/pages/login_page.dart';
import 'package:login_app/pages/otpvalidation_page.dart';
import 'package:login_app/pages/register_page.dart';
import 'package:login_app/pages/splash_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashPage(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: _Paths.OTP_VALIDATE,
      page: () => OTPValidationPage(),
    ),
  ];
}
