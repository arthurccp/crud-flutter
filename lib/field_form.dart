import 'package:flutter/material.dart';

class FieldForm extends StatelessWidget {
  String label;
  bool isPasword;
  TextEditingController controller;

  FieldForm(
      {required this.label,
      required this.isPasword,
      required this.controller,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPasword,
      controller: controller,
      decoration: InputDecoration(
          filled: true, fillColor: Colors.white, labelText: label),
    );
  }
}
