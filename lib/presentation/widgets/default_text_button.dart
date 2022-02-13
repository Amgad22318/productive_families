import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final TextDecoration? textDecoration;

  final String text;
  final Color textColor;

  const DefaultTextButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.textColor = Colors.white,
      this.textDecoration=TextDecoration.underline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(color: textColor, decoration: textDecoration),
      ),
      style: const ButtonStyle(),
    );
  }
}
