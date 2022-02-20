import 'package:flutter/material.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class YouNeedToLoginScreen extends StatelessWidget {
  final String title;
  const YouNeedToLoginScreen({Key? key, required this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: DefaultShopAppbar(
        centerTitle: true,
        title: DefaultText(
          textStyle: Theme.of(context).textTheme.headline5,
          text:title ,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        alignment: AlignmentDirectional.topCenter,
        child: Image.asset(
          'assets/image/appbar_half_circle.png',
        ),
      ),
    );
  }
}
