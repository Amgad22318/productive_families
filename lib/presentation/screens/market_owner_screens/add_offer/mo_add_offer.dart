import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/market_owner_screen_views/category_selector/mo_category_selector_item.dart';
import 'package:productive_families/presentation/views/screen_views/market_owner_screen_views/rounded_input_field/rounded_input_field.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class MarketOwnerAddOfferScreen extends StatelessWidget {
  MarketOwnerAddOfferScreen({Key? key}) : super(key: key);
  final TextEditingController productPriceBeforeController = TextEditingController();
  final TextEditingController productPriceAfterController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        centerTitle: true,
        title: DefaultText(
          textStyle: Theme.of(context).textTheme.headline5,
          text: 'إضافة عرض',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset('assets/icons/back_arrow.svg'),
          )
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/image/appbar_half_circle.png',
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: DefaultText(
                        text: 'الفئه',
                        textStyle: Theme.of(context).textTheme.bodyText1),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MarketOwnerCategorySelectorItem(),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultFormField(
                    hintText: '',
                    textColor: darkBlue,
                    height: 60,
                    horizontalPadding: 32,
                    controller: productNameController,
                    validator: (text) {},
                    keyboardType: TextInputType.text,
                    backgroundColor: Colors.transparent,
                    labelText: 'اسم المتنج',
                    inputEnabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: darkBlue,
                      ),
                    ),
                    inputFocusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: darkBlue),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 10),
                    child: RoundedInputField(
                      hintText: '    تفاصيل العرض   ــــــــــــــــ',
                      onChanged: (p) => {},
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultFormField(
                    hintText: '',
                    textColor: darkBlue,
                    height: 60,
                    horizontalPadding: 32,
                    controller: productPriceBeforeController,
                    validator: (text) {},
                    keyboardType: TextInputType.text,
                    backgroundColor: Colors.transparent,
                    labelText: 'سعر المنتج قبل العرض',
                    inputEnabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: darkBlue,
                      ),
                    ),
                    inputFocusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: darkBlue),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultFormField(
                    hintText: '',
                    textColor: darkBlue,
                    height: 60,
                    horizontalPadding: 32,
                    controller: productPriceAfterController,
                    validator: (text) {},
                    keyboardType: TextInputType.text,
                    backgroundColor: Colors.transparent,
                    labelText: 'سعر المنتج قبل العرض',
                    inputEnabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: darkBlue,
                      ),
                    ),
                    inputFocusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: darkBlue),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DefaultMaterialButton(
                    onPressed: () {},
                    text: 'إضافة عرض جديد',
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
