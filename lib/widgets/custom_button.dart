import 'dart:ui';

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  const CustomButton({required this.onTap, required this.text});
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 50,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16
            ),
          )
        ),
      ),
    );
  }
}
