import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/presentation/views/screen_views/market_owner_screen_views/conversatin/mo_conversation_item.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class MarketOwenrConversationScreen extends StatelessWidget {
  const MarketOwenrConversationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        height: 80,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset('assets/icons/back_arrow.svg'))
        ],
        title: DefaultText(
          text: 'المحادثات',
          textStyle: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(top: 30.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 35,),
          itemBuilder: (context, index) => const MarketOwnerConversationItem(),
          itemCount: 10,
        ),
      ),
    );
  }
}
