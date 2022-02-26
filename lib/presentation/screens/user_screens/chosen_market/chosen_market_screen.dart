import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/chosen_market/market_category_item.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class ChosenMarketScreen extends StatelessWidget {
  const ChosenMarketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        child: SvgPicture.asset('assets/icons/chat.svg'),
        backgroundColor: Colors.white,
        onPressed: () {

          Navigator.pushNamed(context, SELLER_CHAT_SCREEN);

        },
      ),
      appBar: DefaultShopAppbar(
        centerTitle: true,
        title: DefaultText(
          textStyle: Theme.of(context).textTheme.headline5,
          text: 'إسم الأسرة',
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/image/appbar_half_circle.png',
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(top: 8.0,start: 8,end: 8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    StaggeredGrid.count(
                  
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      children: List.generate(11, (index) => const StaggeredGridTile.fit(crossAxisCellCount: 1,
                      child: MarketCategoryItem())),
                    ),
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
