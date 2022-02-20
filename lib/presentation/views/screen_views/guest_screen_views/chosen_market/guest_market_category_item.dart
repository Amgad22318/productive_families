import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/shared/category_item.dart';

class GuestMarketCategoryItem extends StatelessWidget {
  const GuestMarketCategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, GUEST_FILTERING_SCREEN);
        },
        child: CategoryItem());
  }
}
