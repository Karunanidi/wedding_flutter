import 'package:flutter/material.dart';
import 'package:invitation/core/constant.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30.0),
      child: Image.asset(img_divider),
    );
  }
}