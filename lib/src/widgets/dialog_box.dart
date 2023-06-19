import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class DialogBox extends StatelessWidget {
  final String title;
  final String message;
  final Callback onPressed;

  const DialogBox(
      {super.key,
      required this.title,
      required this.message,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        ElevatedButton(
          onPressed: onPressed,
          child: const Text('OK'),
        ),
      ],
    );
  }
}
