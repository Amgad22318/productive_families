import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class MarketOwnerOrderDetailsItem extends StatelessWidget {
  const MarketOwnerOrderDetailsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 2,
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.1),
                ],
              ),
            ),
            child: Image.asset(
              'assets/image/make_up.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Expanded(flex: 7,
                      child: DefaultText(
                        text: 'اسم المنتج ',
                        textStyle: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: DefaultText(
                        textAlign: TextAlign.end,
                        color: goldTextAndStars,
                        text: '\$25950.96',
                        textStyle: Theme.of(context).textTheme.overline,
                      ),
                    ),
                  ],
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
