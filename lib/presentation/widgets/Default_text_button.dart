import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  final VoidCallback onPressed;

  final String text;

  const DefaultTextButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextButton(
      onPressed: onPressed,
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(color: Colors.white,decoration: TextDecoration.underline),
      ),
      style: const ButtonStyle(),
    );
  }
}
