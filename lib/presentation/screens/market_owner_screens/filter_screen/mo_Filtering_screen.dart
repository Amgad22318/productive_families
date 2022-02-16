import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/new_product/mo_add_new_product_screen.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/market_owner_screen_views/filtering_grid_view/mo_filtering_grid_view_item.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/filtering/filtering_grid_view_item.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/widgets/favorite_button_with_number.dart';

class MarketOwnerFilteringScreen extends StatelessWidget {
  const MarketOwnerFilteringScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: DefaultShopAppbar(
        centerTitle: true,
        title: DefaultText(
          textStyle: Theme.of(context).textTheme.headline5,
          text: 'منتجاتى',
        ),
        //TODO: go to index 2
        // leading: IconButton(
        //     onPressed: () {
        //       navigateToAndFinish(context,MarketOwnerAddNewProductScreen());
        //     },
        //     icon: SvgPicture.asset('assets/icons/add-svgrepo-com.svg',height: 25,width: 25,),
        // ),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/image/appbar_half_circle.png',

          ),
          Expanded(
            child: Scrollbar(
              scrollbarOrientation:ScrollbarOrientation.right,
              showTrackOnHover: true,
              isAlwaysShown: true,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: SingleChildScrollView(
                  child: StaggeredGrid.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    children: List.generate(
                        13,
                        (index) => const StaggeredGridTile.fit(
                            crossAxisCellCount: 1, child: MarketOwnerFilteringGridViewItem())),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
