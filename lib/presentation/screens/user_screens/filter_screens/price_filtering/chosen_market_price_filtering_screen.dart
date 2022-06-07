import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/enums.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/widgets/favorite_button_with_number.dart';
import 'package:sizer/sizer.dart';

import '../../../../../business_logic/user/sub_category_product/user_sub_category_product_cubit.dart';

class ChosenMarketPriceFilteringScreen extends StatefulWidget {
  final UserSubCategoryProductCubit userSubCategoryProductCubit;

  const ChosenMarketPriceFilteringScreen(
      {Key? key, required this.userSubCategoryProductCubit})
      : super(key: key);

  @override
  State<ChosenMarketPriceFilteringScreen> createState() =>
      _ChosenMarketPriceFilteringScreenState();
}

class _ChosenMarketPriceFilteringScreenState
    extends State<ChosenMarketPriceFilteringScreen> {
  FilteringScreenPriceFilterRadioValues filterSelected =
      FilteringScreenPriceFilterRadioValues.offers;

  final TextEditingController maxController = TextEditingController();
  final TextEditingController minController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

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
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: SvgPicture.asset('assets/icons/filter.svg'),
                    ),
                    DefaultText(
                      textStyle: Theme.of(context).textTheme.headline6,
                      text: 'نطاق السعر',
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Flexible(
                          flex: 8,
                          child: DefaultFormField(
                              hintText: 'الحد الأدنى',
                              textAlign: TextAlign.center,
                              controller: minController,
                              keyboardType: TextInputType.number),
                        ),
                        const Spacer(),
                        Flexible(
                          flex: 8,
                          child: DefaultFormField(
                              hintText: 'الحد الأقصى',
                              textAlign: TextAlign.center,
                              controller: maxController,
                              keyboardType: TextInputType.number),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    ListTile(
                      title: const Text('العروض'),
                      leading: Radio<FilteringScreenPriceFilterRadioValues>(
                        value: FilteringScreenPriceFilterRadioValues.offers,
                        groupValue: filterSelected,
                        onChanged:
                            (FilteringScreenPriceFilterRadioValues? value) {
                          setState(() {
                            filterSelected = value!;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 2.h),
                    ListTile(
                      title: const Text('الأقرب للمنزل'),
                      leading: Radio<FilteringScreenPriceFilterRadioValues>(
                        value: FilteringScreenPriceFilterRadioValues
                            .nearest_to_home,
                        groupValue: filterSelected,
                        onChanged:
                            (FilteringScreenPriceFilterRadioValues? value) {
                          setState(() {
                            filterSelected = value!;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.h),
                      child: DefaultMaterialButton(
                        height: 40,
                        onPressed: () {
                          if (maxController.text.isEmpty ||
                              minController.text.isEmpty) {
                            widget.userSubCategoryProductCubit.filterBy =
                                filterSelected.name;
                            Navigator.pop(context);
                            widget.userSubCategoryProductCubit
                                .getSubCategoryProduct();
                          } else if (num.parse(maxController.text) >=
                              num.parse(minController.text)) {
                            widget.userSubCategoryProductCubit.filterBy =
                                filterSelected.name;
                            widget.userSubCategoryProductCubit.priceFrom =
                                num.parse(minController.text);
                            widget.userSubCategoryProductCubit.priceTo =
                                num.parse(maxController.text);
                            Navigator.pop(context);
                            widget.userSubCategoryProductCubit
                                .getSubCategoryProduct();
                          } else {
                            showToastMsg(
                                msg:
                                    'الحد الأقصى يجب ان يكون اكبر من الحد الادنى',
                                toastState: ToastStates.ERROR);
                          }
                        },
                        text: 'تصفية',
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
//SfRangeSelectorTheme(
//                   data: SfRangeSelectorThemeData(
//                     tooltipBackgroundColor: filterInActiveYellow,
//                     activeTrackColor: filterYellow,
//                     inactiveTrackColor: filterInActiveYellow,
//                     thumbColor: defaultYellow,
//                   ),
//                   child: SfRangeSelector(
//                     min: min,
//                     max: max,
//                     initialValues: _initialValues,
//                     enableTooltip: true,
//                     onChanged: (value) {
//                       setState(() {
//                         firstSliderValue = value.start;
//                         secondSliderValue = value.end;
//                       });
//                     },
//                     child: SizedBox(
//                       child: buildChart(),
//                       height: 150,
//                     ),
//                   ),
//                 ),
// Widget buildChart() {
//   return SfCartesianChart(
//     borderWidth: 0,
//     plotAreaBorderWidth: 0,
//     margin: EdgeInsets.zero,
//     primaryXAxis: NumericAxis(
//       isVisible: false,
//     ),
//     primaryYAxis: NumericAxis(
//       isVisible: false,
//     ),
//     series: <ChartSeries>[
//       ColumnSeries<Data, double>(
//           dataSource: getChartData(),
//           color: filterYellow,
//           borderColor: Colors.transparent,
//           borderRadius: BorderRadius.circular(24),
//           width: 0.7,
//           spacing: 0.5,
//           xValueMapper: (Data sales, int index) => sales.x,
//           yValueMapper: (Data sales, int index) => sales.y)
//     ],
//   );
// }
//
// List<Data> getChartData() {
//   return <Data>[
//     Data(x: max * 0.05, y: 100),
//     Data(x: max * 0.1, y: 200),
//     Data(x: max * 0.15, y: 150),
//     Data(x: max * 0.2, y: 300),
//     Data(x: max * 0.25, y: 250),
//     Data(x: max * 0.3, y: 170),
//     Data(x: max * 0.35, y: 260),
//     Data(x: max * 0.4, y: 90),
//     Data(x: max * 0.45, y: 180),
//     Data(x: max * 0.5, y: 120),
//     Data(x: max * 0.55, y: 230),
//     Data(x: max * 0.6, y: 138),
//     Data(x: max * 0.65, y: 290),
//     Data(x: max * 0.7, y: 220),
//     Data(x: max * 0.75, y: 129),
//     Data(x: max * 0.8, y: 226),
//     Data(x: max * 0.85, y: 56),
//     Data(x: max * 0.9, y: 122),
//     Data(x: max * 0.95, y: 195),
//   ];
// }
//
// class Data {
//   Data({required this.x, required this.y});
//
//   final double x;
//   final double y;
// }
