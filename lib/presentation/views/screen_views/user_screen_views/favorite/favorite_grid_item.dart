import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/constants/weights.dart';
import 'package:productive_families/data/models/shared_models/shared_classes/api_user__favorite_group.dart';
import 'package:productive_families/presentation/router/arguments/user_arguments/user_selected_favorite_group_args.dart';
import 'package:productive_families/presentation/widgets/default_cached_network_image.dart';
import 'package:sizer/sizer.dart';

import '../../../../../data/models/user_models/favorites/user_all_favorite_groups_model.dart';
import '../../../../widgets/default_text.dart';

class MarketFavoriteItem extends StatelessWidget {
  final ApiUserFavoriteGroups groupModel;

  const MarketFavoriteItem({Key? key, required this.groupModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, SELECTED_FAVORITE_GROUP_SCREEN,
              arguments: UserSelectedFavoriteGroupArgs(
                  groupId: groupModel.id, title: groupModel.title));
        },
        child: Column(
          children: [
            Container(
              height: 25.h,
              width: 40.w,
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              child: DefaultCachedNetworkImage(
                  imageUrl: groupModel.image.path, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultText(
                text: groupModel.title,
                fontSize: 16.sp,
                fontWeight: FontWeights.bold,
                maxLines: 1,
              ),
            )
          ],
        ));
  }
}
