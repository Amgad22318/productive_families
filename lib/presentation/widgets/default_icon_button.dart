import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';

class DefaultIconButton extends StatelessWidget {
  final Widget icon;
  final double radius;
  final Color background;
  final Color? splashColor;
  final VoidCallback onPressed; // voidCallback = void Function()
  final String? text;
  final Widget? child;

  const DefaultIconButton({
    Key? key,
    required this.onPressed,
    this.text,
    this.background = defaultYellow,
    this.radius = 12,
    this.child,
    this.splashColor,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 40,width: 40,
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.all(Radius.circular(radius))),
      child: IconButton(
        alignment: AlignmentDirectional.center,
        splashColor: splashColor,
        color: background,
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
