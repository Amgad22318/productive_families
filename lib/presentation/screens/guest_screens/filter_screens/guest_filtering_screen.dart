import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/guest_screen_views/filtering/guest_filtering_grid_view_item.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/filtering/sub_category_product_grid_Item.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class GuestFilteringScreen extends StatelessWidget {
  const GuestFilteringScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        centerTitle: true,
        title: DefaultText(
          textStyle: Theme.of(context).textTheme.headline5,
          text: 'إسم المتجر',
        ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, USER_REVIEWS_SEARCH_SCREEN);
                },
                icon: const Icon(Icons.search)),

          ],
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios))
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/image/appbar_half_circle.png',
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, GUEST_CHOSEN_MARKET_PRICE_FILTERING_SCREEN);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/message.svg'),
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
                        Navigator.pushNamed(
                            context, GUEST_CHOSEN_MARKET_ORDERING_SCREEN);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/sort.svg'),
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
          Expanded(
            child: Scrollbar(
              scrollbarOrientation: ScrollbarOrientation.right,
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
                            crossAxisCellCount: 1,
                            child: GuestFilteringGridViewItem())),
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
