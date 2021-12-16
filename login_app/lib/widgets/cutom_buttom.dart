import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class CustomButton extends StatelessWidget {
  final String labelText;
  final GestureTapCallback onPressed;

  const CustomButton(
      {Key? key, required this.labelText, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: context.width),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
          padding: MaterialStateProperty.all(EdgeInsets.all(14)),
        ),
        child: Text(
          labelText,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
