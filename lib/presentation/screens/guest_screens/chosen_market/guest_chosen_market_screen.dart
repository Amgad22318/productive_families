import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/views/screen_views/guest_screen_views/chosen_market/guest_market_category_item.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class GuestChosenMarketScreen extends StatelessWidget {
  const GuestChosenMarketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset('assets/icons/back_arrow.svg'),
          )
        ],
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
                      child: GuestMarketCategoryItem())),
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
