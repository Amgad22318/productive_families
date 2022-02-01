import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';

class DefaultMaterialButton extends StatelessWidget {
  final bool isUpperCase;
  final double width;
  final double height;
  final double radius;
  final Color background;
  final Color? splashColor;
  final VoidCallback onPressed; // voidCallback = void Function()
  final String? text;
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  const DefaultMaterialButton(
      {Key? key,
        required this.onPressed, this.text,
        this.width = double.infinity,
        this.isUpperCase = true,
        this.background = defaultYellow,
        this.radius = 30,
        this.child,
        this.splashColor, this.padding, this.height=59 })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: MaterialButton(padding:padding ,
        elevation: 0,
        splashColor: splashColor,
        color: background,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        onPressed: onPressed,
        child: child ??
            Text(
              isUpperCase ? text!.toUpperCase() : text!,
              style: Theme.of(context).textTheme.button!.copyWith(color: darkBlue),
            ),
      ),
    );
  }
}
