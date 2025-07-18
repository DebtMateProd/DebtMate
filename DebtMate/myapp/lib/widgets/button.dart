import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String labelText;
  final VoidCallback? onPressed;

  const CustomButton({
    Key? key,
    required this.labelText,
    required this.onPressed,
  }) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, // Background color
        backgroundColor: Colors.cyan, // Text color
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5, // Shadow depth
      ),
      child: Text(
        labelText,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}