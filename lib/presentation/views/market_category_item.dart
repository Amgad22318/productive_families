import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/views/category_item.dart';

class MarketCategoryItem extends StatelessWidget {
  const MarketCategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
Navigator.pushNamed(context, FILTERING_SCREEN);
        },
        child: CategoryItem());
  }
}
