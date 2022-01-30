import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class HomeSectionItem extends StatelessWidget {
  const HomeSectionItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: defaultYellow, width: 1),
            ),
            child: Image.asset(
              'assets/image/laundry.png',
              height: 50,
              width: 50,
              fit: BoxFit.scaleDown,
            ),
          ),
          DefaultText(text: 'ملابس',textStyle: Theme.of(context).textTheme.caption,)

        ],
      ),
    );
  }
}
