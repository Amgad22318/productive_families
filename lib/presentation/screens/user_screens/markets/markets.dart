import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/markets/market_section_item.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/markets/markets_grid_view_item.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class Markets extends StatelessWidget {
  const Markets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(centerTitle: true,
        title: DefaultText(textStyle: Theme.of(context).textTheme.headline5,text: 'المتاجر',),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/image/appbar_half_circle.png',
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, MARKETS_PRICE_FILTERING_SCREEN);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/icons/filter.png'),
                                  DefaultText(
                                    text: 'تصفية',
                                    textStyle: Theme.of(context).textTheme.button,
                                    color: greyText,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, MARKETS_ORDERING_SCREEN);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/icons/sort.png'),
                                  DefaultText(
                                    text: 'ترتيب',
                                    textStyle: Theme.of(context).textTheme.button,
                                    color: greyText,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 8.0),
                    child: DefaultText(
                      maxLines: 2,
                      text: 'الأقسام',
                      textStyle: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                      List.generate(20, (index) {
                        return MarketSectionItem(index: index,isMarket: true,);
                      })
                      ,
                    ),
                  ),
                  StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 2,
                    children: List.generate(11, (index) => const StaggeredGridTile.fit(crossAxisCellCount: 1,
                    child: MarketsGridViewItems())),
                  ) 

                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}
