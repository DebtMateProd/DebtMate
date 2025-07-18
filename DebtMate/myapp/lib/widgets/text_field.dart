import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool hideText;

  const InputTextField({
    super.key, 
    required this.controller,
    this.labelText = '',
    this.hideText = false
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.cyan,
        labelText: labelText
        ),
      obscureText: hideText,
    );
  }
}