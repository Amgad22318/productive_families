import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class MarketOwnerFilteringGridViewItem extends StatelessWidget {
  const MarketOwnerFilteringGridViewItem({Key? key}) : super(key: key);

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
          Stack(
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
                padding: const EdgeInsets.all(8.0),
                child: DefaultIconButton(
                  onPressed: () {
                   Navigator.pushNamed(context, MARKET_OWNER_EDIT_PRODUCT_SCREEN);
                  },
                  icon: SvgPicture.asset('assets/icons/edit-svgrepo-com.svg'),
                  background: Colors.white,
                ),
              )
            ],
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
                const SizedBox(height: 4,),
                Row(
                  children: [
                    Expanded(
                flex: 1,
                      child: DefaultText(
                        color: backgroundBlack,
                        text: 'اسم المتجر',
                        textStyle: Theme.of(context).textTheme.overline,
                      ),
                    ),
                    Flexible(
                       flex: 0,
                       child: Align(
                         alignment: AlignmentDirectional.centerEnd,
                         child: Row(
                           children: [
                             DefaultText(
                               color: greyText,
                               text: '(تقييم 30)',
                               textStyle: Theme.of(context).textTheme.overline?.copyWith(fontSize: 8),
                             ),
                             RatingBarIndicator(
                              rating: 2.6,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 9.0,
                              direction: Axis.horizontal,
                    ),
                           ],
                         ),
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
