import 'package:flutter/material.dart';

class SpacerView extends StatelessWidget {
  final double spaceSize;

  const SpacerView({Key? key, required this.spaceSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: spaceSize,
    );
  }
}
