import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/styles/colors.dart';

import 'default_text.dart';

class MarketOwnerDrawerListTiles extends StatelessWidget {
   final String text;
   final String icon;
   final void Function()? onTap ;

   const MarketOwnerDrawerListTiles({Key? key, required this.text, required this.icon,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        color: formFieldBackGroundLightBlue,
        child: ListTile(
          onTap: onTap,
          title: DefaultText(color: Colors.white,
            text: text,
            textStyle: Theme.of(context).textTheme.bodyText2,
          ),
          leading: SvgPicture.asset(icon,height: 30,width: 30,color: backGroundWhite,)
        ),
      ),
    );
  }
}
