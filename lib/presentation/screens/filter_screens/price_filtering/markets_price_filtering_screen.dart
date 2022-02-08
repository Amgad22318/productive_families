import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/enums.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/widgets/favorite_button_with_number.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class MarketsPriceFilteringScreen extends StatefulWidget {
  const MarketsPriceFilteringScreen({Key? key}) : super(key: key);

  @override
  State<MarketsPriceFilteringScreen> createState() => _MarketsPriceFilteringScreenState();
}

class _MarketsPriceFilteringScreenState extends State<MarketsPriceFilteringScreen> {
  late SfRangeValues _initialValues;

  late double firstSliderValue;
  late double secondSliderValue;
  late double max;
  late double min;
  FilteringScreenPriceFilterRadioValues? _character = FilteringScreenPriceFilterRadioValues.offers;


  @override
  void initState() {
    min = 500;
    max = 100000;
    _initialValues = SfRangeValues(max * 0.2, max * 0.8);
    firstSliderValue = max * 0.2;
    secondSliderValue = max * 0.8;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        centerTitle: true,
        title: DefaultText(
          textStyle: Theme.of(context).textTheme.headline5,
          text: 'تصفية',
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset('assets/icons/back_arrow.svg'))
        ],
        leading: FavoriteButtonWithNumber(),
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
                    onPressed: () {                      Navigator.pop(context);
                    },
                    icon: Image.asset('assets/icons/filter.png')),
                DefaultText(
                  textStyle: Theme.of(context).textTheme.headline6,
                  text: 'نطاق السعر',
                ),
                DefaultText(
                  textStyle: Theme.of(context).textTheme.headline6,
                  color: filterYellow,
                  text:
                      '${firstSliderValue.round().toString()} - ${secondSliderValue.round().toString()}',
                ),
                SfRangeSelectorTheme(
                  data: SfRangeSelectorThemeData(
                    tooltipBackgroundColor: filterInActiveYellow,
                      activeTrackColor: filterYellow,
                    inactiveTrackColor: filterInActiveYellow,
                    thumbColor: defaultYellow,
                  ),
                  child: SfRangeSelector(
                    min: min,
                    max: max,
                    initialValues: _initialValues,
                    enableTooltip: true,
                    onChanged: (value) {
                      setState(() {
                        firstSliderValue = value.start;
                        secondSliderValue = value.end;
                      });
                    },
                    child: SizedBox(
                      child: buildChart(),
                      height: 150,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text('العروض'),
                  leading: Radio<FilteringScreenPriceFilterRadioValues>(
                    value: FilteringScreenPriceFilterRadioValues.offers,
                    groupValue: _character,
                    onChanged: (FilteringScreenPriceFilterRadioValues? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('الأقرب للمنزل'),
                  leading: Radio<FilteringScreenPriceFilterRadioValues>(
                    value: FilteringScreenPriceFilterRadioValues.closeToHome,
                    groupValue: _character,
                    onChanged: (FilteringScreenPriceFilterRadioValues? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 64),
                  child: DefaultMaterialButton(
                    height: 40,
                    onPressed: () {},
                    text: 'تصفية',
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildChart() {
    return SfCartesianChart(

borderWidth: 0,
      plotAreaBorderWidth: 0,
      margin: EdgeInsets.zero,
      primaryXAxis: NumericAxis(
        isVisible: false,
      ),
      primaryYAxis: NumericAxis(
        isVisible: false,
      ),
      series: <ChartSeries>[
        ColumnSeries<Data, double>(
            dataSource: getChartData(),

            color: filterYellow,
            borderColor: Colors.transparent,
            borderRadius: BorderRadius.circular(24),
            width: 0.7,
            spacing: 0.5,
            xValueMapper: (Data sales, int index) => sales.x,
            yValueMapper: (Data sales, int index) => sales.y)
      ],
    );
  }

  List<Data> getChartData() {
    return <Data>[
      Data(x: max * 0.05, y: 100),
      Data(x: max * 0.1, y: 200),
      Data(x: max * 0.15, y: 150),
      Data(x: max * 0.2, y: 300),
      Data(x: max * 0.25, y: 250),
      Data(x: max * 0.3, y: 170),
      Data(x: max * 0.35, y: 260),
      Data(x: max * 0.4, y: 90),
      Data(x: max * 0.45, y: 180),
      Data(x: max * 0.5, y: 120),
      Data(x: max * 0.55, y: 230),
      Data(x: max * 0.6, y: 138),
      Data(x: max * 0.65, y: 290),
      Data(x: max * 0.7, y: 220),
      Data(x: max * 0.75, y: 129),
      Data(x: max * 0.8, y: 226),
      Data(x: max * 0.85, y: 56),
      Data(x: max * 0.9, y: 122),
      Data(x: max * 0.95, y: 195),
    ];
  }
}

class Data {
  Data({required this.x, required this.y});

  final double x;
  final double y;
}