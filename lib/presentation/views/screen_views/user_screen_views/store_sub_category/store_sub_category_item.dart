import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/constants/weights.dart';
import 'package:productive_families/presentation/widgets/default_cached_network_image.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../../../../data/models/user_models/stores/user_store_sub_category_model.dart';
import '../../../../styles/colors.dart';

class StoreSubCategoryItem extends StatelessWidget {
  final int providerId;
  final SubCategories subCategoriesModel;

  const StoreSubCategoryItem({
    Key? key,
    required this.providerId,
    required this.subCategoriesModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, FILTERING_SCREEN);
        },
        child: Column(
          children: [
            Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: defaultYellow, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: SizedBox.fromSize(
                  size:  Size.fromRadius(8.h),
                  child: DefaultCachedNetworkImage(
                      imageUrl: subCategoriesModel.image.path.toString(),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: DefaultText(
                  text: subCategoriesModel.name,
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeights.bold)),
            )
          ],
        ));
  }
}
