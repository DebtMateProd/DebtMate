import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool hideText;
  final TextInputType inputType;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool readOnly;
  final int? maxLines;
  final FocusNode? focusNode;

  const InputTextField({
    super.key, 
    required this.controller,
    this.labelText = '',
    this.hideText = false,
    this.inputType = TextInputType.text,
    this.readOnly = false, 
    this.onChanged,
    this.maxLines = 1,
    this.focusNode,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      keyboardType: inputType,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      maxLines: maxLines,
      focusNode: focusNode,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 117, 219, 250),
        filled: true,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        floatingLabelStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
      readOnly: readOnly,
      obscureText: hideText,
    );
  }
}