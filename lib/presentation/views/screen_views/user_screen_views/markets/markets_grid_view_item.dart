import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/widgets/default_cached_network_image.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

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
          Navigator.pushNamed(context, STORE_SUB_CATEGORY_SCREEN,arguments: storesModel.providerId);
        },
        child: Column(
          children: [
             CircleAvatar(
                radius: 50,
                child:DefaultCachedNetworkImage(imageUrl: storesModel.providerImage.path.toString(), fit: BoxFit.cover)),
            DefaultText(
              maxLines: 2,
              text: storesModel.serviceName,
              textStyle: Theme.of(context).textTheme.headline6,
            ),


          ],
        ),
      ),
    );
  }
}
