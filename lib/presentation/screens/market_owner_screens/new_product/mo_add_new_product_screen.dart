import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/market_owner_screen_views/category_selector/mo_category_selector_item.dart';
import 'package:productive_families/presentation/views/screen_views/market_owner_screen_views/image_picker/mo_image_picker_item.dart';
import 'package:productive_families/presentation/views/screen_views/market_owner_screen_views/rounded_input_field/rounded_input_field.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class MarketOwnerAddNewProductScreen extends StatelessWidget {
  MarketOwnerAddNewProductScreen({Key? key}) : super(key: key);
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        centerTitle: true,

        title: DefaultText(
          textStyle: Theme.of(context).textTheme.headline5,
          text: 'إضافة منتج',
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.pushReplacementNamed(context, MARKET_OWNER_FILTERING_SCREEN_SCREEN);
        //     },
        //     icon: SvgPicture.asset('assets/icons/back_arrow.svg'),
        //   )
        // ],
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
                    height: 10,
                  ),
                  const MarketOwnerImagePickerItem(),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 7),
                    child: Align(
                        alignment: Alignment.center,
                        child: DefaultText(
                          text: 'إضافة صور المنتج',
                          textStyle: Theme.of(context).textTheme.caption,
                        )),
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
                      hintText: '    وصف المنتج   ــــــــــــــــ',
                      onChanged: (p) => {},
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: DefaultText(
                          text: 'القسم',
                          textStyle: Theme.of(context).textTheme.bodyText1)),
                  MarketOwnerCategorySelectorItem(),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultFormField(
                    hintText: '',
                    textColor: darkBlue,
                    height: 60,
                    horizontalPadding: 32,
                    controller: productPriceController,
                    validator: (text) {},
                    keyboardType: TextInputType.text,
                    backgroundColor: Colors.transparent,
                    labelText: 'سعر المنتج',
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
                    text: 'إضافة منتج',
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
