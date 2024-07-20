import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  CustomTextField({required this.onChanged, required this.text});
  final String text;
  Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return '$text is required';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: const TextStyle(
            color: Colors.white
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.red
          ),
        ),
        // focusedErrorBorder: const OutlineInputBorder(
        //   borderSide: BorderSide(
        //       color: Colors.red
        //   ),
        // ),
        focusedBorder:const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white
          ),
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
      ),cursorColor: Colors.white,
    );
  }
}
