import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class DefaultDrawerListTile extends StatelessWidget {
  final String text;
  final String icon;
  final void Function()? onTap;
  const DefaultDrawerListTile({Key? key,required this.text, required this.icon,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        tileColor: lightBlue,
        leading: SvgPicture.asset(
          icon,
          color: Colors.white,
          height: 24,
          width: 24,
        ),
        title: DefaultText(
            color: Colors.white,
            text:text ,
            textStyle: Theme.of(context).textTheme.subtitle2),
        onTap: onTap,
      ),
    );
  }
}
