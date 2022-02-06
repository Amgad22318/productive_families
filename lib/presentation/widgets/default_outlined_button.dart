import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';

class DefaultOutlinedButton extends StatelessWidget {
  final bool isUpperCase;
  final double width;
  final double height;
  final double radius;
  final VoidCallback onPressed; // voidCallback = void Function()
  final String? text;
  final Widget? child;
  final Color? textColor;

  const DefaultOutlinedButton(
      {Key? key,
      required this.onPressed,
      this.text,
      this.width = double.infinity,
      this.isUpperCase = true,
      this.radius = 30,
      this.child,
      this.height = 59, this.textColor= darkBlue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,

      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          side: const BorderSide(width: 2, color: defaultYellow),
        ),
        onPressed: onPressed,
        child: child ??
            Text(
              isUpperCase ? text!.toUpperCase() : text!,
              style:  TextStyle(color: textColor),
            ),
      ),
    );
  }
}
