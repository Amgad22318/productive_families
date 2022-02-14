import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class MarketOwnerAppNotificationItem extends StatelessWidget {
  const MarketOwnerAppNotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      color: greyText.withOpacity(0.2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              CircleAvatar(
                  // child: Text('logo'),
                  )
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                    text: 'إشعار من التطبيق',
                    textStyle: Theme.of(context).textTheme.bodyText1),
                DefaultText(
                    maxLines: 5,
                    text:
                        'النص تص تجريبي لتيبي لتحسين تصميمالنص تص تجريبي ل لتيبي لتحسين تصميمالنص تص لتaحسين تصميم',
                    textStyle: Theme.of(context).textTheme.caption),
              ],
            ),
          )
        ],
      ),
    );
  }
}
