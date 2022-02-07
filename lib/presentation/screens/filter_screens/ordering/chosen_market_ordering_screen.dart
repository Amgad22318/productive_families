import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/enums.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/widgets/favorite_button_with_number.dart';

class ChosenMarketOrderingScreen extends StatefulWidget {
  const ChosenMarketOrderingScreen({Key? key}) : super(key: key);

  @override
  State<ChosenMarketOrderingScreen> createState() => _ChosenMarketOrderingScreenState();
}

class _ChosenMarketOrderingScreenState extends State<ChosenMarketOrderingScreen> {

  FilteringOrderingScreenRadioValues? _character = FilteringOrderingScreenRadioValues.bestSeller;


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
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset('assets/icons/sort.png')),

                ListTile(
                  title: const Text('الأكثر مبيعا'),
                  leading: Radio<FilteringOrderingScreenRadioValues>(
                    value: FilteringOrderingScreenRadioValues.bestSeller,
                    groupValue: _character,
                    onChanged: (FilteringOrderingScreenRadioValues? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('الأكثر تقيما'),
                  leading: Radio<FilteringOrderingScreenRadioValues>(
                    value: FilteringOrderingScreenRadioValues.mostRated,
                    groupValue: _character,
                    onChanged: (FilteringOrderingScreenRadioValues? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('أقل سعر إلى أعلى سعر'),
                  leading: Radio<FilteringOrderingScreenRadioValues>(
                    value: FilteringOrderingScreenRadioValues.lowToHighPrice,
                    groupValue: _character,
                    onChanged: (FilteringOrderingScreenRadioValues? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('أعلى سعر إلى أقل سعر'),
                  leading: Radio<FilteringOrderingScreenRadioValues>(
                    value: FilteringOrderingScreenRadioValues.highToLowPrice,
                    groupValue: _character,
                    onChanged: (FilteringOrderingScreenRadioValues? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('من الأحدث للأقدم'),
                  leading: Radio<FilteringOrderingScreenRadioValues>(
                    value: FilteringOrderingScreenRadioValues.newest,
                    groupValue: _character,
                    onChanged: (FilteringOrderingScreenRadioValues? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(

                  title: const Text('من الأقدم للأحدث'),
                  leading: Radio<FilteringOrderingScreenRadioValues>(
                    value: FilteringOrderingScreenRadioValues.oldest,
                    groupValue: _character,
                    onChanged: (FilteringOrderingScreenRadioValues? value) {
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
