import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/basket/basket_item.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_outlined_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_splitter_builder.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: DefaultShopAppbar(
        centerTitle: true,
        actions: [
          GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SvgPicture.asset(
                  "assets/icons/back_arrow.svg",
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              })
        ],
        title:  DefaultText(
          text: 'السله',
          textStyle: Theme.of(context).textTheme.headline6
        ),
      ),
      body: Column(
        children: [
          const Image(image: AssetImage('assets/image/appbar_half_circle.png')),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    separatorBuilder: (BuildContext context, int index) =>
                        const DefaultSplitterBuilder(),
                    itemBuilder: (BuildContext context, int index) {
                      return BasketMealItem();
                    },
                  ),
                  Container(
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Flexible(
                              child: DefaultOutlinedButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(context, SHOP_LAYOUT, (route) => false);

                            },
                            text: 'إضافة عناصر',
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                              child: DefaultMaterialButton(
                            onPressed: () {
                              Navigator.pushNamed(context,ORDER_CONFIRMATION_SCREEN );

                            },
                            text: 'تأكيد الطلب',
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
