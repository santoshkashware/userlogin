import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {
  final String label;
  final TextDecoration textDecoration;
  final GestureTapCallback onPressed;

  const ClickableText(
      {Key? key,
      required this.label,
      required this.textDecoration,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            decoration: textDecoration,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
