import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/router/arguments/user_arguments/store_sub_category_args.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_cached_network_image.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../../../../data/models/user_models/shared_classes/single_and_all_categories_user_store.dart';

class MarketsGridViewItems extends StatelessWidget {
 final SingleAndAllCategoriesUserStore storesModel;
  const MarketsGridViewItems( {Key? key,required this.storesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, STORE_SUB_CATEGORY_SCREEN,arguments:StoreSubCategoryArgs(providerId: storesModel.providerId, serviceName: storesModel.serviceName));
        },
        child: Column(
          children: [
             SizedBox(
              height: 9.h,
               width: 9.h,
               child: ClipOval(clipBehavior:Clip.antiAlias,
                  child:DefaultCachedNetworkImage(imageUrl: storesModel.providerImage.path, fit: BoxFit.cover,)),
             ),
            DefaultText(
              maxLines: 1,
              text: storesModel.serviceName,
              textStyle: Theme.of(context).textTheme.headline6,
            ),
            DefaultText(color: darkBlue.withOpacity(0.6),
              
              maxLines: 1,
              text: storesModel.providerName,
              textStyle: Theme.of(context).textTheme.bodyText2,
            ),


          ],
        ),
      ),
    );
  }
}
