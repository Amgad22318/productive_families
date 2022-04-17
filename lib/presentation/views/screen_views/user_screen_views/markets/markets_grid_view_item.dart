import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class MarketsGridViewItems extends StatelessWidget {
  const MarketsGridViewItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, CHOSEN_MARKET_SCREEN);
        },
        child: Column(
          children: [
            const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/image/user_photo.png')),
            DefaultText(
              maxLines: 2,
              text: 'الاسم',
              textStyle: Theme.of(context).textTheme.headline6,
            ),


          ],
        ),
      ),
    );
  }
}
