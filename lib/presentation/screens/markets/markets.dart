import 'package:flutter/material.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class Markets extends StatelessWidget {
  const Markets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(centerTitle: true,
        title: DefaultText(textStyle: Theme.of(context).textTheme.headline5,text: 'المتاجر',),
      ),
      body: Column( crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/image/appbar_half_circle.png',
          ),
      CircleAvatar(radius: 50,backgroundImage:AssetImage('assets/image/user_photo.png'))

        ],
      ),
    );

  }
}
