import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/enums.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/widgets/favorite_button_with_number.dart';

import '../../../../../business_logic/user/sub_category_product/user_sub_category_product_cubit.dart';

class ChosenMarketOrderingScreen extends StatefulWidget {
  final UserSubCategoryProductCubit userSubCategoryProductCubit;

  const ChosenMarketOrderingScreen(
      {Key? key, required this.userSubCategoryProductCubit})
      : super(key: key);

  @override
  State<ChosenMarketOrderingScreen> createState() =>
      _ChosenMarketOrderingScreenState();
}

class _ChosenMarketOrderingScreenState
    extends State<ChosenMarketOrderingScreen> {
  FilteringOrderingScreenRadioValues _sort_sellected =
      FilteringOrderingScreenRadioValues.top_sales;

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
        leading: const FavoriteButtonWithNumber(),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/image/appbar_half_circle.png',
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset('assets/icons/sort.svg')),
                ListTile(
                  title: const Text('الأكثر مبيعا'),
                  leading: Radio<FilteringOrderingScreenRadioValues>(
                    value: FilteringOrderingScreenRadioValues.top_sales,
                    groupValue: _sort_sellected,
                    onChanged: (FilteringOrderingScreenRadioValues? value) {
                      setState(() {
                        _sort_sellected = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('الأكثر تقيما'),
                  leading: Radio<FilteringOrderingScreenRadioValues>(
                    value: FilteringOrderingScreenRadioValues.top_rated,
                    groupValue: _sort_sellected,
                    onChanged: (FilteringOrderingScreenRadioValues? value) {
                      setState(() {
                        _sort_sellected = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('أقل سعر إلى أعلى سعر'),
                  leading: Radio<FilteringOrderingScreenRadioValues>(
                    value: FilteringOrderingScreenRadioValues.less_price,
                    groupValue: _sort_sellected,
                    onChanged: (FilteringOrderingScreenRadioValues? value) {
                      setState(() {
                        _sort_sellected = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('أعلى سعر إلى أقل سعر'),
                  leading: Radio<FilteringOrderingScreenRadioValues>(
                    value: FilteringOrderingScreenRadioValues.higher_price,
                    groupValue: _sort_sellected,
                    onChanged: (FilteringOrderingScreenRadioValues? value) {
                      setState(() {
                        _sort_sellected = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('من الأحدث للأقدم'),
                  leading: Radio<FilteringOrderingScreenRadioValues>(
                    value: FilteringOrderingScreenRadioValues.latest,
                    groupValue: _sort_sellected,
                    onChanged: (FilteringOrderingScreenRadioValues? value) {
                      setState(() {
                        _sort_sellected = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('من الأقدم للأحدث'),
                  leading: Radio<FilteringOrderingScreenRadioValues>(
                    value: FilteringOrderingScreenRadioValues.oldest,
                    groupValue: _sort_sellected,
                    onChanged: (FilteringOrderingScreenRadioValues? value) {
                      setState(() {
                        _sort_sellected = value!;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 64),
                  child: DefaultMaterialButton(
                    height: 40,
                    onPressed: () {
                      widget.userSubCategoryProductCubit.sortBy =
                          _sort_sellected.name;
                      Navigator.pop(context);
                      widget.userSubCategoryProductCubit
                          .getSubCategoryProduct();
                    },
                    text: 'ترتيب',
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
