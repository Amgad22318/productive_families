import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class HomeSectionItem extends StatelessWidget {
  HomeSectionItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
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
            DefaultText(
              text: ' ملابس',
              textStyle: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      ),
    );
  }
}
