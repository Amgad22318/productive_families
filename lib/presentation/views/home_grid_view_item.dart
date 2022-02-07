import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class HomeGridViewItem extends StatelessWidget {
  const HomeGridViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ABOUT_PRODUCT);
      },
      child: Card(
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
                      Expanded(flex: 3,
                        child: DefaultText(
                          text: 'اسم المنتج اسم المنتج اسم المنتج اسم المنتج اسم المنتج',
                          textStyle: Theme.of(context).textTheme.overline,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: DefaultText(
                          textAlign: TextAlign.end,
                          color: goldTextAndStars,
                          text: '\$250000.96',
                          textStyle: Theme.of(context).textTheme.overline,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: DefaultText(
                          text: 'اسم المتجر',
                          textStyle: Theme.of(context).textTheme.overline,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: DefaultText(
                          color: Colors.grey,
                          text: '(30502 تقييم)',
                          textStyle: Theme.of(context).textTheme.overline,
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Flexible(
                        flex: 0,
                        child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: RatingBarIndicator(
                            rating: 2.6,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 9.0,
                            direction: Axis.horizontal,
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
      ),
    );
  }
}
