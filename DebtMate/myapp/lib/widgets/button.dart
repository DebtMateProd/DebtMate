import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String labelText;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.labelText,
    required this.onPressed,
  });

   @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, // Background color
        backgroundColor: Colors.cyan, // Text color
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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