import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/views/selected_favorite_item.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class SelectedFavoriteScreen extends StatelessWidget {
  const SelectedFavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        centerTitle: true,
        actions: [
          IconButton(
              icon: SvgPicture.asset(
                "assets/icons/back_arrow.svg",
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
        title: const DefaultText(
          text: 'طعام',
          textStyle: TextStyle(),
        ),
      ),
      body: Column(
        children: [
          const Image(image: AssetImage('assets/image/appbar_half_circle.png')),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SelectedFavoriteItem(),
                  SelectedFavoriteItem(),
                  SelectedFavoriteItem(),
                  SelectedFavoriteItem(),
                  SelectedFavoriteItem(),
                  SelectedFavoriteItem(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
