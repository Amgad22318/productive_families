import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class MarketSectionItem extends StatefulWidget {
  final int? index;
  bool isMarket;

  MarketSectionItem({
    Key? key,
    required this.index,
    this.isMarket = false,
  }) : super(key: key);

  @override
  State<MarketSectionItem> createState() => _MarketSectionItemState();
}

class _MarketSectionItemState extends State<MarketSectionItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4),
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.isMarket = !widget.isMarket;
          });
        },
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: defaultYellow, width: 1),
                  ),
                  child: Image.asset(
                    'assets/image/laundry.png',
                    height: 60,
                    width: 60,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                DefaultText(
                  text: ' ملابس',
                  textStyle: Theme.of(context).textTheme.caption,
                )
              ],
            ),
            Positioned.fill(
                child: Container(
              color: widget.isMarket
                  ? Colors.white.withOpacity(0.5)
                  : Colors.transparent,
            ))
          ],
        ),
      ),
    );
  }
}
