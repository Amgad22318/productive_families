import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';

class DefaultText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final Color color;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final double? textScaleFactor;


  const DefaultText(
      {Key? key,
        required this.text,
        this.maxLines = 1,
        this.color = darkBlue,
        required this.textStyle, this.textAlign, this.textScaleFactor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: TextDirection.rtl,
      style: textStyle!.copyWith(color: color,),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      textScaleFactor:textScaleFactor ,

    );
  }
}
