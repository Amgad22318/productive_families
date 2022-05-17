import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/enums.dart';
import 'package:productive_families/data/models/shared_models/shared_classes/api_user__favorite_group.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_cached_network_image.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

import '../../../../../business_logic/user/favorite_state/user_favorite_state_cubit.dart';

class FilteringFavBottomSheetGroupItem extends StatelessWidget {
  final int productId;
  final ApiUserFavoriteGroups groupModel;

  FilteringFavBottomSheetGroupItem(
      {Key? key, required this.groupModel, required this.productId})
      : super(key: key);
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          DefaultCachedNetworkImage(
              imageUrl: groupModel.image.path,
              fit: BoxFit.cover,
              width: 50,
              height: 50),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: DefaultText(
                text: groupModel.title,
                textStyle: Theme
                    .of(context)
                    .textTheme
                    .caption,
              ),
            ),
          ),
          Flexible(
            flex: 0,
            child: DefaultIconButton(
              background: darkBlue,
              height: 30,
              width: 30,
              radius: 24,
              onPressed: () {
                UserFavoriteStateCubit.get(context)
                    .userFavoritesGroupAddOrDeleteProduct(
                    groupId: groupModel.id, productId: productId);
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
