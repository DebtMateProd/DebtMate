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
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
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