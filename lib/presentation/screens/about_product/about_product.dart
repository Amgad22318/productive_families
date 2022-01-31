import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AboutProduct extends StatefulWidget {
  const AboutProduct({Key? key}) : super(key: key);

  @override
  State<AboutProduct> createState() => _AboutProductState();
}

class _AboutProductState extends State<AboutProduct> {
  late int fullProductCarouselSliderImagesActiveIndex;

  @override
  void initState() {
    fullProductCarouselSliderImagesActiveIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        centerTitle: true,
        title: DefaultText(
          textStyle: Theme.of(context).textTheme.headline5,
          text: 'عن المنتج',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset('assets/icons/back_arrow.svg'),
          )
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/image/appbar_half_circle.png',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                CarouselSlider(
                    items: [
                      Image.asset(
                        'assets/image/make_up.png',
                        fit: BoxFit.contain,
                      ),
                      Image.asset(
                        'assets/image/make_up.png',
                        fit: BoxFit.contain,
                      ),
                      Image.asset(
                        'assets/image/make_up.png',
                        fit: BoxFit.contain,
                      ),
                      Image.asset(
                        'assets/image/make_up.png',
                        fit: BoxFit.contain,
                      ),
                      Image.asset(
                        'assets/image/make_up.png',
                        fit: BoxFit.contain,
                      ),
                      Image.asset(
                        'assets/image/make_up.png',
                        fit: BoxFit.contain,
                      ),
                    ],
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            fullProductCarouselSliderImagesActiveIndex = index;
                          });
                        },
                        autoPlay: true,
                        height: 250,
                        initialPage: 0,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1500),
                        viewportFraction: 1,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal)),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.only(top: 8.0, start: 16),
                  child: DefaultIconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.red,
                    ),
                    background: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: AnimatedSmoothIndicator(
              duration: const Duration(milliseconds: 1500),
              curve: Curves.fastLinearToSlowEaseIn,
              count: 6,
              // backend must put limit
              activeIndex: fullProductCarouselSliderImagesActiveIndex,
              effect: const CustomizableEffect(
                  activeDotDecoration: DotDecoration(
                    color: defaultYellow,
                    height: 5,
                    width: 10,
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                  ),
                  dotDecoration: DotDecoration(
                      dotBorder: DotBorder(
                        width: 1,
                        color: Colors.grey,
                      ),
                      height: 10,
                      width: 10,
                      borderRadius: BorderRadius.all(Radius.circular(3)))),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  textStyle: Theme.of(context).textTheme.subtitle1,
                  text: 'اسم المنتج',
                ),
                DefaultText(
                  textStyle: Theme.of(context).textTheme.bodyText2,
                  text: '\$279.96',
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RatingBarIndicator(
                      rating: 2.6,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 24.0,
                      direction: Axis.horizontal,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    DefaultText(
                      color: Colors.grey,
                      text: '(30 تقييم)',
                      textStyle: Theme.of(context).textTheme.overline,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                  height: 50,
                  width: double.infinity,
                  color: productDescriptionBackGround,

                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
