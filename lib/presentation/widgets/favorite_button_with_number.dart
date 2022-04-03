import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/presentation/screens/user_screens/shop_layout/user_shop_layout.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class FavoriteButtonWithNumber extends StatelessWidget {
  const FavoriteButtonWithNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(

      elevation: 0,
      position: BadgePosition.topStart(top: 12, start: 1),
      padding: EdgeInsetsDirectional.all(4.5),
      badgeColor: Colors.white,
      badgeContent: DefaultText(
        text: '5',
        textStyle: TextStyle(fontSize: 7),
      ),
      child: IconButton(
          padding: EdgeInsetsDirectional.zero,
          onPressed: () {
            navigateToAndFinish(
                context,
                const UserShopLayout(
                  index: 2,
                ));
          },
          icon: const Icon(
            Icons.favorite,
            color: Colors.red,
          )),
    );
  }
}
