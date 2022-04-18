import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DefaultSvg extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final Color? color;
  final AlignmentGeometry alignment;

  const DefaultSvg({
    Key? key,
    required this.imagePath,
    this.width,
    this.height,
    this.color, this.alignment= Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      width: width,
      height: height,
      color: color,
      alignment: alignment,
    );
  }
}
