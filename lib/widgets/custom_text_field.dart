import 'package:flutter/material.dart';
import 'package:food_app_order/helpers/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labText;
  final TextInputType keyboardType;

  CustomTextField({
    this.controller,
    this.labText,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: textColor)),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
        labelStyle: TextStyle(color: primaryColor),
        labelText: labText,
      ),
    );
  }
}
