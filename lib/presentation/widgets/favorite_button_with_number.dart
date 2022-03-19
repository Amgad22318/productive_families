import 'package:flutter/material.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/presentation/screens/user_screens/shop_layout/user_shop_layout.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class FavoriteButtonWithNumber extends StatelessWidget {
  const FavoriteButtonWithNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        IconButton(
            onPressed: () {
              navigateToAndFinish(
                  context,
                  UserShopLayout(
                    index: 2,
                  ));
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            )),
        Positioned.directional(
          textDirection: TextDirection.rtl,
          top: 10,
          end: 5,
          child: Container(
            height: 14,
            width: 14,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white,
                border: Border.all(width: 2, color: lightDefaultYellow)),
            child: Center(
                child: DefaultText(
              text: '5',
              textStyle: TextStyle(fontSize: 7),
            )),
          ),
        )
      ],
    );
  }
}
