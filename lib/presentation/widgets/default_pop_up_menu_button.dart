import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';

class DefaultPopUpMenuButton extends StatelessWidget {
  final Widget icon;
  final void  Function(dynamic)? onSelected;
  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;
  final double radius;
  final Color background;
  final double height;
  final double width;

  const DefaultPopUpMenuButton({
    Key? key,
    this.background = defaultYellow,
    this.radius = 12,
    required this.icon,
    this.height = 40,
    this.width = 40, this.onSelected, required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.all(Radius.circular(radius))),
      child: PopupMenuButton(
        color: background,
        onSelected: onSelected,
        icon: icon,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
