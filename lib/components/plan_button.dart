import 'package:flutter/material.dart';

class PlanButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color foregroundColor;
  final Color backgroundColor;

  const PlanButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.foregroundColor,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.black))),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: foregroundColor,
        ),
      ),
    );
  }
}
