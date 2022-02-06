import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class FilteringScreen extends StatelessWidget {
  const FilteringScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        centerTitle: true,
        title: DefaultText(
          textStyle: Theme.of(context).textTheme.headline5,
          text: 'إسم المتجر',
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset('assets/icons/back_arrow.svg'))
        ],
        leading: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                )),
            Positioned.directional(
              textDirection: TextDirection.rtl,
              top: 10,
              end: 5,
              child: Container(
                height: 14,
                width: 14,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white,
                    border: Border.all(width: 2, color: lightDefaultYellow)),
                child: Center(
                    child: DefaultText(
                  text: '5',
                  textStyle: TextStyle(fontSize: 7),
                )),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/image/appbar_half_circle.png',
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: InkWell(

                        onTap: () {
                          Navigator.pushNamed(context, PRICE_FILTERING_SCREEN);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Image.asset('assets/icons/filter.png'),
                            DefaultText(
                              text: 'تصفية',
                              textStyle: Theme.of(context).textTheme.button,
                              color: greyText,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, ORDERING_SCREEN);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/sort.png'),
                            DefaultText(
                              text: 'ترتيب',
                              textStyle: Theme.of(context).textTheme.button,
                              color: greyText,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
