import 'package:flutter/material.dart';
import 'package:productive_families/data/models/user_models/orders/user_order_tracks_model.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class OrderFollowUpItem extends StatelessWidget {
 final Tracks trackModel;

  OrderFollowUpItem(
      {required this.trackModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:  4.0),
      child: Row(
        children: [
          if (trackModel.check) ...[
            const CircleAvatar(
              backgroundColor: orderFollowUpGreyCheck,
              child: Icon(
                Icons.check,
                color: backGroundGreen,
                size: 25,
              ),
            ),
          ]else if(trackModel.check == false)...[
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
                  text: trackModel.statusString, textStyle: Theme.of(context).textTheme.bodyText1),
              DefaultText(
                  text: trackModel.time, textStyle: Theme.of(context).textTheme.bodyText2),
            ],
          ),
        ],
      ),
    );
  }
}
