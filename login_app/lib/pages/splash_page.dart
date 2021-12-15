import 'package:flutter/material.dart';
import 'package:login_app/view%20models/splash_view_model.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<SplashViewModel>(context,listen: false).checkUser(context);
    return Scaffold(
      body: Container(
        color: Colors.cyan,
        child: Center(
          child: new Text("Hello Splash"),
        ),
      ),
    );
  }
}
