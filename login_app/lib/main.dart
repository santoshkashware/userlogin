import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/routes/app_pages.dart';
import 'package:login_app/utils/them_data.dart';
import 'package:login_app/view%20models/feed_view_model.dart';
import 'package:login_app/view%20models/login_view_model.dart';
import 'package:login_app/view%20models/product_view_model.dart';
import 'package:login_app/view%20models/profile_view_model.dart';
import 'package:login_app/view%20models/register_view_model.dart';
import 'package:login_app/view%20models/validateotp_view_model.dart';
import 'package:provider/provider.dart';

import 'view models/splash_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => SplashViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => LoginViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => RegisterViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => ProfileViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => ValidateOtpViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => FeedViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => ProductViewModel(),
      ),
    ],
    child: GetMaterialApp(
      title: "Login Demo",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: Themes.light,
      darkTheme: Themes.dark,
    ),
  ));
}
