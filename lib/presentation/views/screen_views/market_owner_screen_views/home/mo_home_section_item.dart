import 'package:flutter/material.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/presentation/screens/user_screens/shop_layout/shop_layout.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class MarketOwnerHomeSectionItem extends StatelessWidget {
 const MarketOwnerHomeSectionItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 4),
      child: GestureDetector(
        onTap: () {
          navigateToAndFinish(context,const ShopLayout(index: 1,));
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 5),
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  decoration: BoxDecoration(
                    color: backGroundWhite,
                    shape: BoxShape.circle,
                    border: Border.all(color: defaultYellow, width: 1),
                  ),
                  child: Image.asset(
                    'assets/image/laundry.png',
                    height: 60,
                    width: 60,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 10),
              child: DefaultText(
                text: ' ملابس',
                textStyle: Theme.of(context).textTheme.caption,
                color: backGroundWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
