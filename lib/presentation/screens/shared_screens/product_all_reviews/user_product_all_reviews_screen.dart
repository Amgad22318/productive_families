import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/about_product/about_product_review_item.dart';

import '../../../widgets/default_shop_appbar.dart';
import '../../../widgets/default_text.dart';

class UserProductAllReviewsScreen extends StatelessWidget {
  const UserProductAllReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        centerTitle: true,
        title: DefaultText(
          textStyle: Theme.of(context).textTheme.headline5,
          text: 'تقييمات المنتج',
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset('assets/icons/back_arrow.svg'))
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/image/appbar_half_circle.png',
          ),
          // Expanded(
          //   child: Padding(
          //     padding:  const EdgeInsets.symmetric(horizontal: 8),
          //     child: ListView.builder(
          //       itemCount: 10,
          //       itemBuilder: (context, index) => const AboutProductReviewItem(),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
