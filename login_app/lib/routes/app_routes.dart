part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const SPLASH = _Paths.SPLASH;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const HOME = _Paths.HOME;
  static const OTP_VALIDATE = _Paths.OTP_VALIDATE;
  static const ADD_PRODUCT = _Paths.ADD_PRODUCT;
}

abstract class _Paths {
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const HOME = '/home';
  static const OTP_VALIDATE = '/otpvalidate';
  static const ADD_PRODUCT = '/addproduct';
}
