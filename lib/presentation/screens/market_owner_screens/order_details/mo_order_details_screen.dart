import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/market_owner_screen_views/my_products/mo_order_details_item.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_outlined_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class MarketOwnerOrderDetailsScreen extends StatelessWidget {
  const MarketOwnerOrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        centerTitle: true,
        title: DefaultText(
          textStyle: Theme.of(context).textTheme.headline5,
          text: 'تفاصيل الطلب',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset('assets/icons/back_arrow.svg'),
          ),
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/image/appbar_half_circle.png',
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric( vertical: 8),
              child: SingleChildScrollView(
                child: Column(

                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 20),
                      child: Flexible(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(end: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                SvgPicture.asset(
                                  'assets/icons/location.svg',
                                  height: 50,
                                  width: 50,
                                ),
                                 const SizedBox(height: 80,),
                              ],),
                            ),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DefaultText(
                                    text: 'الموقع',
                                    textStyle:
                                        Theme.of(context).textTheme.headline6,
                                    maxLines: 2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(start: 15),
                                    child: DefaultText(
                                      text: 'حسام سعيد محمد',
                                      textStyle:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  DefaultText(
                                      text: 'الجريفه',
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .caption
                                          ?.copyWith(color: greyText.withOpacity(0.3))),
                                  DefaultText(
                                      text: 'الدكتور ابراهيم ناجى',
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .caption
                                          ?.copyWith(color: greyText.withOpacity(0.3))),
                                  DefaultText(
                                      text: 'رقم الجوال : 123456789',
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .caption
                                          ?.copyWith(color: greyText.withOpacity(0.3))),
                                  const SizedBox(height: 20,),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      color: greyText,
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: StaggeredGrid.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 6,
                        children: List.generate(
                            13,
                            (index) => const StaggeredGridTile.fit(
                                crossAxisCellCount: 1,
                                child: MarketOwnerOrderDetailsItem())),
                      ),
                    ),
                    Padding(
                      padding:const EdgeInsets.symmetric(vertical: 30),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefaultMaterialButton(
                            textColor: Colors.white,
                            width: 130,
                            background: darkBlue,
                            height: 50,
                            text: 'قبول',
                            onPressed: () {
                              Navigator.pushNamed(context,MARKET_OWNER_ORDER_FOLLOW_UP_SCREEN);
                            },
                          ),
                          const SizedBox(width: 30,),
                          DefaultOutlinedButton(
                            borderColor: darkBlue,
                            width: 130,
                            height: 50,
                            text: 'رفض',
                            onPressed: () {},
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
