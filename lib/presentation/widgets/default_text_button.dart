import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';

class DefaultTextButton extends StatelessWidget {
  final VoidCallback onPressed;

  final String text;
final Color textColor;
  const DefaultTextButton(
      {Key? key, required this.text, required this.onPressed, this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextButton(
      onPressed: onPressed,
      child: Text(
        text.toUpperCase(),
        style:  TextStyle(color: textColor,decoration: TextDecoration.underline),
      ),
      style: const ButtonStyle(),
    );
  }
}
