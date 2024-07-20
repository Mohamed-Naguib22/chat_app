import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class CustomChatMessage extends StatelessWidget {
  final Message message;
  const CustomChatMessage({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomRight:Radius.circular(32),
            topLeft:Radius.circular(32),
            topRight:Radius.circular(32),
          )
        ),
        child: Text(
          message.message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
