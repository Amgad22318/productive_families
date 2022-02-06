import 'package:flutter/material.dart';
import 'package:productive_families/presentation/views/market_section_item.dart';
import 'package:productive_families/presentation/views/markets_grid_view_item.dart';
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
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 2,
                    childAspectRatio: 1 / 1,
                    children: List.generate(11, (index) => MarketsGridViewItems()),
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
