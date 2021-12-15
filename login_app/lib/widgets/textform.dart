import 'package:flutter/material.dart';

class InputFieldArea extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String labelText;
  final IconData iconData;

  const InputFieldArea(
      {Key? key,
      required this.controller,
      required this.obscureText,
      required this.labelText,
      required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
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
