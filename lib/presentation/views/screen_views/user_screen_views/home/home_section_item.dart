import 'package:flutter/material.dart';
import 'package:productive_families/business_logic/user/stores/all_and_single_category_stores_cubit.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/data/models/user_models/category/user_all_categories_model.dart';
import 'package:productive_families/presentation/screens/user_screens/shop_layout/user_shop_layout.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_cached_network_image.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

import '../../../../../constants/constants.dart';

class HomeSectionItem extends StatelessWidget {
  final Categories category;
  final int index;
  HomeSectionItem( {
    Key? key, required this.category, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 4),
      child: InkWell(
        onTap: () {

          navigateToAndFinish(context,const UserShopLayout(index: 1,));
          SelectedCategoryFromHome=index+1;
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: defaultYellow, width: 1),
              ),
              child: ClipOval(clipBehavior:Clip.antiAlias ,
                child: DefaultCachedNetworkImage(imageUrl: category.categoryImage.path.toString(),
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            DefaultText(
              text: category.name,
              textStyle: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      ),
    );
  }
}
