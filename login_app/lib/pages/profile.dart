import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:login_app/utils/masked_text_controller.dart';
import 'package:login_app/utils/validator.dart';
import 'package:login_app/view%20models/profile_view_model.dart';
import 'package:login_app/widgets/clickable_text.dart';
import 'package:login_app/widgets/cutom_buttom.dart';
import 'package:login_app/widgets/spacer_view.dart';
import 'package:login_app/widgets/textform.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileViewModel = Provider.of<ProfileViewModel>(context);
    profileViewModel.initializeObject();
    return getContentView(profileViewModel, context);
  }

  getContentView(profileViewModel, context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 60, left: 16, right: 16),
          child: SingleChildScrollView(
            child: Form(
              key: profileViewModel.loginFormKey,
              child: Column(
                children: [
                  SpacerView(spaceSize: 10),
                  InputFieldArea(
                    controller: profileViewModel.fNameController!,
                    obscureText: false,
                    labelText: "First Name",
                    iconData: Icons.person,
                    inputFormatter: MaskTextInputFormatter(),
                  ),
                  SpacerView(
                    spaceSize: 16,
                  ),
                  InputFieldArea(
                      controller: profileViewModel.lNameController!,
                      obscureText: false,
                      labelText: "Last Name",
                      iconData: Icons.person,
                      inputFormatter: MaskTextInputFormatter()),
                  SpacerView(
                    spaceSize: 16,
                  ),
                  InputFieldArea(
                      controller: profileViewModel.mobileController!,
                      obscureText: false,
                      labelText: "000 000 0000",
                      iconData: Icons.phone_android,
                      inputFormatter:
                          MaskTextInputFormatter(mask: "### ### ####")),
                  SpacerView(
                    spaceSize: 16,
                  ),
                  InputFieldArea(
                      controller: profileViewModel.dobController!,
                      obscureText: false,
                      labelText: "dd-MM-yyyy",
                      iconData: Icons.cake,
                      inputFormatter:
                          MaskTextInputFormatter(mask: "##-##-####")),
                  SpacerView(
                    spaceSize: 16,
                  ),
                  InputFieldArea(
                      controller: profileViewModel.emailController!,
                      obscureText: false,
                      labelText: "Email",
                      iconData: Icons.email,
                      inputFormatter: MaskTextInputFormatter()),
                  SpacerView(
                    spaceSize: 16,
                  ),
                  InputFieldArea(
                      controller: profileViewModel.passwordController!,
                      obscureText: true,
                      labelText: "Password",
                      iconData: Icons.lock,
                      inputFormatter: MaskTextInputFormatter()),
                  SpacerView(
                    spaceSize: 16,
                  ),
                  getGenderView(profileViewModel),
                  SpacerView(
                    spaceSize: 16,
                  ),
                  CustomButton(
                      labelText: "Update Profile",
                      onPressed: () {
                        profileViewModel.checkUpdate();
                      }),
                  SpacerView(
                    spaceSize: 16,
                  ),
                  profileViewModel.loadingView
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getGenderView(viewModel) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Radio(
                activeColor: Colors.red,
                value: Gender.Male,
                groupValue: viewModel.defaultGender,
                onChanged: (val) {
                  viewModel.updateGender(val);
                },
              ),
              Text(
                "Male",
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                activeColor: Colors.red,
                value: Gender.Female,
                groupValue: viewModel.defaultGender,
                onChanged: (val) {
                  viewModel.updateGender(val);
                },
              ),
              Text(
                "Female",
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                activeColor: Colors.red,
                value: Gender.Other,
                groupValue: viewModel.defaultGender,
                onChanged: (val) {
                  viewModel.updateGender(val);
                },
              ),
              Text(
                "Other",
              ),
            ],
          )
        ],
      ),
    );
  }
}
