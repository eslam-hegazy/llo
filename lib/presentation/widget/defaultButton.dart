import 'package:flutter/material.dart';

import '../styles/colors.dart';
import 'defaultText.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function press;

  DefaultButton({required this.text, required this.press, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: color,
        ),
      ),
      color: color,
      child: MaterialButton(
        onPressed: () => press(),
        child: defaultText(
          text: text,
          color: AppColor.white,
          size: 15,
        ),
      ),
    );
  }
}
