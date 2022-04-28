import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';

class DefaultText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final Color color;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final double? textScaleFactor;
  final FontWeight? fontWeight;
  final double? fontSize;

  const DefaultText(
      {Key? key,
      required this.text,
      this.maxLines = 1,
      this.color = darkBlue,
      this.textStyle,
      this.textAlign,
      this.textScaleFactor,
      this.fontWeight,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: TextDirection.rtl,
      style: textStyle != null
          ? textStyle!.copyWith(
              color: color, fontWeight: fontWeight, fontSize: fontSize)
          : TextStyle(color: color, fontWeight: fontWeight, fontSize: fontSize),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      textScaleFactor: textScaleFactor,
    );
  }
}
