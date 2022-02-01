import 'package:flutter/material.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class MarketsGridViewItems extends StatelessWidget {
  const MarketsGridViewItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
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
    );
  }
}
