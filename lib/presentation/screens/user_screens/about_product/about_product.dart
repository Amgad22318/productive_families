import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/shared/fav_bottom_sheet.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
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
  late bool fullProductDescription;

  @override
  void initState() {
    fullProductDescription = false;
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
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, BASKET_SCREEN);
            },
            icon: SvgPicture.asset(
              'assets/icons/shopping-cart-outline-badged.svg',
            )),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/image/appbar_half_circle.png',
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                                    fullProductCarouselSliderImagesActiveIndex =
                                        index;
                                  });
                                },
                                autoPlay: true,
                                height: 180,
                                initialPage: 0,
                                autoPlayInterval: const Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 1500),
                                viewportFraction: 1,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                scrollDirection: Axis.horizontal)),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 8.0, start: 16),
                          child: DefaultIconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: const FavBottomSheet(),
                                ),
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                              );
                            },
                            icon: const Icon(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)))),
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
                          textStyle: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold),
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
                            const SizedBox(
                              width: 8,
                            ),
                            DefaultText(
                              color: Colors.grey,
                              text: '(30 تقييم)',
                              textStyle: Theme.of(context).textTheme.overline,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          padding: EdgeInsetsDirectional.all(8),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: productDescriptionBackGround,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  DefaultText(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyText2,
                                    text: 'وصف المنتج',
                                  ),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          fullProductDescription =
                                              !fullProductDescription;
                                        });
                                      },
                                      icon: SvgPicture.asset(
                                        'assets/icons/product_description_down_arrow.svg',
                                        color: darkBlue,
                                      ))
                                ],
                              ),
                              Text(
                                '  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة   لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة   لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة   لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة   لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة   لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة   لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة   لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة   لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة   لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة   لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة   لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة  لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة ',
                                maxLines: fullProductDescription ? null : 1,
                                overflow: fullProductDescription
                                    ? null
                                    : TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.caption,
                              )
                            ],
                          ),
                        ),
                        DefaultText(
                          textStyle: Theme.of(context).textTheme.subtitle1,
                          text: 'تقييمات المنتج',
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100.0, vertical: 16),
                          child: DefaultMaterialButton(
                            onPressed: () {
                              Navigator.pushNamed(context, BASKET_SCREEN);
                            },
                            height: 50,
                            text: 'كل التقييمات',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8),
                          child: DefaultMaterialButton(
                            onPressed: () {
                              Navigator.pushNamed(context, BASKET_SCREEN);
                            },
                            fontSize: 20,
                            height: 50,
                            text: 'اضافة للسلة',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
