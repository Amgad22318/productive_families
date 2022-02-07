import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class AppNotificationItem extends StatelessWidget {
  const AppNotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      height: size.height * 0.12,
      width: double.infinity,
      color: Color(0xFFECECEC),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              CircleAvatar(
                  // child: Text('logo'),
                  )
            ],
          ),
          SizedBox(
            width: size.width * 0.05,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: DefaultText(
                    maxLines: 1,
                      text: 'إشعار من التطبيق',
                      textStyle: Theme.of(context).textTheme.bodyText1),
                ),
                Expanded(
                  flex: 2,
                  child: DefaultText(
                    maxLines: 2,
                      text: 'النص تص تجريبي لتيبي لتحسين تصميمالنص تص تجريبي ل لتيبي لتحسين تصميمالنص تص لتحسين تصميم',
                      textStyle: Theme.of(context).textTheme.caption),

                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
