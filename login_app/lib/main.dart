import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/routes/app_pages.dart';
import 'package:login_app/utils/them_data.dart';
import 'package:provider/provider.dart';

import 'view models/splash_view_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SplashViewModel(),
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
    );
  }
}