import 'package:flutter/material.dart';
import 'package:login_app/view%20models/validateotp_view_model.dart';
import 'package:login_app/widgets/cutom_buttom.dart';
import 'package:login_app/widgets/otptext_field.dart';
import 'package:login_app/widgets/spacer_view.dart';
import 'package:provider/provider.dart';

class OTPValidationPage extends StatelessWidget {
  const OTPValidationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final otpViewModel = Provider.of<ValidateOtpViewModel>(context);
    otpViewModel.initializeObject();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff7f6fb),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.phone_android_sharp),
              ),
              SpacerView(
                spaceSize: 24,
              ),
              Text(
                'Verification',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SpacerView(
                spaceSize: 10,
              ),
              Text(
                "Enter your OTP code number",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SpacerView(
                spaceSize: 28,
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OTPtextField(
                          controller: otpViewModel.otpController1!,
                          first: true,
                          last: false,
                        ),
                        OTPtextField(
                          first: false,
                          last: false,
                          controller: otpViewModel.otpController2!,
                        ),
                        OTPtextField(
                          first: false,
                          last: false,
                          controller: otpViewModel.otpController3!,
                        ),
                        OTPtextField(
                          first: false,
                          last: true,
                          controller: otpViewModel.otpController4!,
                        ),
                      ],
                    ),
                    SpacerView(
                      spaceSize: 22,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        labelText: "Verify",
                        onPressed: () {
                          otpViewModel.validateOtp();
                        },
                      ),
                    )
                  ],
                ),
              ),
              SpacerView(
                spaceSize: 18,
              ),
              Text(
                "Didn't you receive any code?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SpacerView(
                spaceSize: 18,
              ),
              Text(
                "Resend New Code",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
