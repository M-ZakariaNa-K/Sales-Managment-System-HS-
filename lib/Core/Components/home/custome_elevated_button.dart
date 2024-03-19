import 'package:flutter/material.dart';

class CustomeElevatedButton extends StatelessWidget {
  const CustomeElevatedButton({
    super.key,
    required this.buttonColor,
    required this.buttonChild,
    required this.onPressed,
  });
  final Color buttonColor;
  final Widget buttonChild;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // Set border radius
        ),
      ),
      onPressed: onPressed,
      child: buttonChild,
    );
  }
}
