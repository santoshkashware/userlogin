import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:login_app/utils/masked_text_controller.dart';
import 'package:login_app/view%20models/login_view_model.dart';
import 'package:login_app/widgets/clickable_text.dart';
import 'package:login_app/widgets/cutom_buttom.dart';
import 'package:login_app/widgets/spacer_view.dart';
import 'package:login_app/widgets/textform.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);
    loginViewModel.initializeObject();
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 60, left: 16, right: 16),
          child: SingleChildScrollView(
            child: Form(
              // key: loginViewModel.loginFormKey,
              child: Column(
                children: [
                  Text(
                    "User Login ",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SpacerView(
                    spaceSize: 20,
                  ),
                  InputFieldArea(
                    controller: loginViewModel.emailController!,
                    obscureText: false,
                    labelText: "Email",
                    iconData: Icons.email,
                    inputFormatter: MaskTextInputFormatter(),
                  ),
                  SpacerView(
                    spaceSize: 16,
                  ),
                  InputFieldArea(
                    controller: loginViewModel.passwordController!,
                    obscureText: true,
                    labelText: "Password",
                    inputFormatter: MaskTextInputFormatter(),
                    iconData: Icons.lock,
                  ),
                  SpacerView(
                    spaceSize: 16,
                  ),
                  CustomButton(
                      labelText: "Login",
                      onPressed: () {
                        loginViewModel.hideKeyBoard(context);
                        loginViewModel.checkLogin();
                      }),
                  SpacerView(
                    spaceSize: 20,
                  ),
                  loginViewModel.loadingView
                      ? SpinKitThreeBounce(
                          color: Colors.white,
                          size: 20,
                        )
                      : SpacerView(
                          spaceSize: 0,
                        ),
                  SpacerView(
                    spaceSize: 20,
                  ),
                  Text('You do not have account?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                      )),
                  SpacerView(
                    spaceSize: 15,
                  ),
                  ClickableText(
                    label: "Register",
                    textDecoration: TextDecoration.underline,
                    onPressed: () {
                      loginViewModel.navigateToRegisterView();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
