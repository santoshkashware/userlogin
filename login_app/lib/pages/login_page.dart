import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:login_app/view%20models/login_view_model.dart';
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
              child: Column(
                children: [
                  Text(
                    "User Login ",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InputFieldArea(
                    controller: loginViewModel.emailController,
                    obscureText: false,
                    labelText: "Email",
                    iconData: Icons.email,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  InputFieldArea(
                    controller: loginViewModel.passwordController,
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
                        "Login",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      onPressed: () {
                        loginViewModel.checkLogin();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('You do not have account?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text('Register',
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
