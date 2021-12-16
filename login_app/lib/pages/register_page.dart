import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:login_app/utils/masked_text_controller.dart';
import 'package:login_app/view%20models/register_view_model.dart';
import 'package:login_app/widgets/clickable_text.dart';
import 'package:login_app/widgets/cutom_buttom.dart';
import 'package:login_app/widgets/spacer_view.dart';
import 'package:login_app/widgets/textform.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerViewModel = Provider.of<RegisterViewModel>(context);
    registerViewModel.initializeObject();
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 60, left: 16, right: 16),
          child: SingleChildScrollView(
            child: Form(
              key: registerViewModel.loginFormKey,
              child: Column(
                children: [
                  Text(
                    "User Register ",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SpacerView(
                    spaceSize: 20,
                  ),
                  InputFieldArea(
                    controller: registerViewModel.fNameController!,
                    obscureText: false,
                    labelText: "First Name",
                    iconData: Icons.person,
                    inputFormatter: MaskTextInputFormatter(),
                  ),
                  SpacerView(
                    spaceSize: 16,
                  ),
                  InputFieldArea(
                      controller: registerViewModel.lNameController!,
                      obscureText: false,
                      labelText: "Last Name",
                      iconData: Icons.person,
                      inputFormatter: MaskTextInputFormatter()),
                  SpacerView(
                    spaceSize: 16,
                  ),
                  InputFieldArea(
                      controller: registerViewModel.mobileController!,
                      obscureText: false,
                      labelText: "000 000 000",
                      iconData: Icons.phone_android,
                      inputFormatter:
                          MaskTextInputFormatter(mask: "### ### #####")),
                  SpacerView(
                    spaceSize: 16,
                  ),
                  InputFieldArea(
                      controller: registerViewModel.dobController!,
                      obscureText: false,
                      labelText: "dd-MM-yyyy",
                      iconData: Icons.cake,
                      inputFormatter:
                          MaskTextInputFormatter(mask: "##-##-####")),
                  SpacerView(
                    spaceSize: 16,
                  ),
                  InputFieldArea(
                      controller: registerViewModel.emailController!,
                      obscureText: false,
                      labelText: "Email",
                      iconData: Icons.email,
                      inputFormatter: MaskTextInputFormatter()),
                  SpacerView(
                    spaceSize: 16,
                  ),
                  InputFieldArea(
                      controller: registerViewModel.passwordController!,
                      obscureText: true,
                      labelText: "Password",
                      iconData: Icons.lock,
                      inputFormatter: MaskTextInputFormatter()),
                  SpacerView(
                    spaceSize: 16,
                  ),
                  CustomButton(
                      labelText: "Register",
                      onPressed: () {
                        registerViewModel.checkLogin();
                      }),
                  SpacerView(
                    spaceSize: 16,
                  ),
                  registerViewModel.loadingView
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
                  Text('You have account?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                      )),
                  SpacerView(
                    spaceSize: 20,
                  ),
                  ClickableText(
                    label: "Login",
                    textDecoration: TextDecoration.underline,
                    onPressed: () {
                      registerViewModel.hideKeyBoard(context);
                      registerViewModel.navigateToLogin();
                    },
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     registerViewModel.hideKeyBoard(context);
                  //     registerViewModel.navigateToLogin();
                  //   },
                  //   child: Text('Login',
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(
                  //         fontSize: 18,
                  //         decoration: TextDecoration.underline,
                  //         fontWeight: FontWeight.bold,
                  //       )),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
