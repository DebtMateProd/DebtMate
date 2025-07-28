import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool hideText;
  final bool numberKeyboard;
  final ValueChanged<String>? onChanged; // <-- update type here

  const InputTextField({
    super.key, 
    required this.controller,
    this.labelText = '',
    this.hideText = false,
    this.numberKeyboard = false,
    this.onChanged, // <-- keep as is
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      keyboardType: numberKeyboard ? TextInputType.number : TextInputType.text,
      onChanged: onChanged, // <-- pass directly
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
      obscureText: hideText,
    );
  }
}