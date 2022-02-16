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
  final Color borderColor;
  final double? fontSize;
  final double? textScaleFactor;

  const DefaultOutlinedButton(
      {Key? key,
      required this.onPressed,
      this.text,
      this.width = double.infinity,
      this.isUpperCase = true,
      this.radius = 30,
      this.child,
      this.height = 59,
      this.textColor = darkBlue,
      this.fontSize,
      this.borderColor = defaultYellow,
      this.textScaleFactor})
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
          side: BorderSide(width: 2, color: borderColor),
        ),
        onPressed: onPressed,
        child: child ??
            Text(
              isUpperCase ? text!.toUpperCase() : text!,
              textScaleFactor: textScaleFactor,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.button!.copyWith(
                    color: textColor,
                    fontSize: fontSize,
                  ),
            ),
      ),
    );
  }
}
