import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/utils/masked_text_controller.dart';

class InputFieldArea extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String labelText;
  final IconData iconData;
  final MaskTextInputFormatter inputFormatter;

  const InputFieldArea(
      {Key? key,
      required this.controller,
      required this.obscureText,
      required this.labelText,
      required this.iconData,
      required this.inputFormatter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        inputFormatters: [inputFormatter],
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: labelText,
          prefixIcon: Icon(iconData),
        ),
      ),
    );
  }
}

class UpperCaseTextFormatter implements TextInputFormatter {
  const UpperCaseTextFormatter();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(text: newValue.text, selection: newValue.selection);
  }
}
