import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class MarketOwnerHomeFirstSectionItem extends StatelessWidget {
  MarketOwnerHomeFirstSectionItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 4),
      child: GestureDetector(
        onTap: () {
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 5),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: backGroundWhite,
                      border: Border.all(color: defaultYellow, width: 1),
                    ),
                    child: Image.asset(
                      'assets/image/delivery-truck.png',
                      height: 60,
                      width: 60,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  const CircleAvatar(
                    radius: 10,
                    backgroundColor: backGroundGreen,
                    child: Icon(Icons.check,size: 15,color: backGroundWhite,),
                  ),
                ],
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
