import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/enums.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class GuestChosenMarketPriceFilteringScreen extends StatefulWidget {
  const GuestChosenMarketPriceFilteringScreen({Key? key}) : super(key: key);

  @override
  State<GuestChosenMarketPriceFilteringScreen> createState() =>
      _GuestChosenMarketPriceFilteringScreenState();
}

class _GuestChosenMarketPriceFilteringScreenState
    extends State<GuestChosenMarketPriceFilteringScreen> {
  FilteringScreenPriceFilterRadioValues? _character =
      FilteringScreenPriceFilterRadioValues.offers;

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
                    icon: SvgPicture.asset('assets/icons/message.svg')),
                DefaultText(
                  textStyle: Theme.of(context).textTheme.headline6,
                  text: 'نطاق السعر',
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
                    value:
                        FilteringScreenPriceFilterRadioValues.nearest_to_home,
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
}
