import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class GuestMarketsGridViewItems extends StatelessWidget {
  const GuestMarketsGridViewItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, GUEST_CHOSEN_MARKET_SCREEN);
        },
        child: Column(
          children: [
            CircleAvatar(
                radius: 50,
                backgroundImage: const AssetImage('assets/image/user_photo.png')),
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
