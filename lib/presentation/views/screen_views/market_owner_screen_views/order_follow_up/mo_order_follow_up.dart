import 'package:flutter/material.dart';
import 'package:productive_families/data/models/user_models/orders/user_order_tracks_model.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class MOOrderFollowUpItem extends StatelessWidget {
  final bool isDone;
  final String text;
  final String date;

  MOOrderFollowUpItem(
      {required this.isDone, required this.text, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:  4.0),
      child: Row(
        children: [
          if (isDone) ...[
            const CircleAvatar(
              backgroundColor: orderFollowUpGreyCheck,
              child: Icon(
                Icons.check,
                color: backGroundGreen,
                size: 25,
              ),
            ),
          ]else if(isDone == false)...[
            const CircleAvatar(
              backgroundColor: orderFollowUpGreyCheck,

            ),
          ],
          const SizedBox(
            width: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultText(
                  text: text, textStyle: Theme.of(context).textTheme.bodyText1),
              DefaultText(
                  text: date, textStyle: Theme.of(context).textTheme.bodyText2),
            ],
          ),
        ],
      ),
    );
  }
}
