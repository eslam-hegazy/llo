import 'package:flutter/material.dart';

import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class DefaultTextForm extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType type;
  final bool secure;
  final Widget? iconPress;
  final String error;
  DefaultTextForm({
    required this.controller,
    required this.hintText,
    required this.type,
    required this.secure,
    required this.iconPress,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        validator: (value) {
          if (value!.isEmpty) {
            return error;
          }
          return null;
        },
        obscureText: secure,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: iconPress,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              width: 5,
              color: AppColor.hintColor,
            ),
          ),
        ),
      ),
    );
  }
}
