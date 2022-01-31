import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class HomeGridViewItem extends StatelessWidget {
  const HomeGridViewItem({Key? key}) : super(key: key);

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
            height: 120,
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
            child: Column(
              children: [
                Row(
                  children: [
                    DefaultText(
                      text: 'اسم المنتج',
                      textStyle: Theme.of(context).textTheme.caption,
                    ),
                    const Spacer(),
                    DefaultText(
                      color: goldTextAndStars,
                      text: '\$279.96',
                      textStyle: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                Row(
                  children: [
                    DefaultText(
                      text: 'اسم المتجر',
                      textStyle: Theme.of(context).textTheme.caption,
                    ),
                    const Spacer(),
                    DefaultText(
                      color: Colors.grey,
                      text: '(30 تقييم)',
                      textStyle: Theme.of(context).textTheme.overline,
                    ),
                    RatingBarIndicator(
                      rating: 2.6,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 8.0,
                      direction: Axis.horizontal,
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
