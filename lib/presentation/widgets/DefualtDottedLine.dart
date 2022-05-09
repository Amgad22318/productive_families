import 'package:flutter/material.dart';

class DefaultDottedLine extends StatelessWidget {
  final double dashWidth;
  final double dashHeight;
  final Color color;
  final Axis axis;

  const DefaultDottedLine(
      {Key? key,
      this.axis = Axis.horizontal,
      this.dashWidth = 1,
      this.color = Colors.black,
      this.dashHeight = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: axis,
        );
      },
    );
  }
}
