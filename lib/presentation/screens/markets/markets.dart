import 'package:flutter/material.dart';
import 'package:productive_families/presentation/views/home_section_item.dart';
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
                  SizedBox(height: 100,
                    child: Expanded(
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>  HomeSectionItem(index:index,isMarket: true,),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                          itemCount: 20),
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
