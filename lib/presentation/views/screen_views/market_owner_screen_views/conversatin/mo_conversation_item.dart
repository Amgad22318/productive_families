import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class MarketOwnerConversationItem extends StatelessWidget {
  const MarketOwnerConversationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MARKET_OWNER_CHAT_SCREEN);
      },
      child: Row(
        children: [
          const Expanded(
            flex: 4,
            child: CircleAvatar(
              radius: 32,
              backgroundColor: defaultYellow,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/image/user_photo.png'),
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    text: 'حسام سعيد',
                    textStyle: Theme.of(context).textTheme.bodyText1,
                  ),
                  DefaultText(
                    text: 'اريد توصيل الطلب الى',
                    textStyle: Theme.of(context).textTheme.caption,
                  ),
                ],
              )),
          Expanded(
              flex: 4,
              child: Column(
                children: [
                  DefaultText(
                      text: '22/2/2022',
                      textStyle: Theme.of(context).textTheme.overline),
                  const SizedBox(
                    height: 5,
                  ),
                  const CircleAvatar(
                    radius: 15,
                    backgroundColor: defaultYellow,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
