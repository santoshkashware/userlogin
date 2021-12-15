import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:login_app/view%20models/register_view_model.dart';
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
                  SizedBox(
                    height: 20,
                  ),
                  InputFieldArea(
                    controller: registerViewModel.emailController!,
                    obscureText: false,
                    labelText: "Email",
                    iconData: Icons.email,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  InputFieldArea(
                    controller: registerViewModel.passwordController!,
                    obscureText: true,
                    labelText: "Password",
                    iconData: Icons.lock,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: context.width),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepPurpleAccent),
                        padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                      ),
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      onPressed: () {
                        registerViewModel.checkLogin();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  registerViewModel.loadingView
                      ? SpinKitThreeBounce(
                    color: Colors.white,
                    size: 20,
                  )
                      : SizedBox(
                    height: 0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('You have account?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      registerViewModel.hideKeyBoard(context);
                      registerViewModel.navigateToLogin();
                    },
                    child: Text('Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
