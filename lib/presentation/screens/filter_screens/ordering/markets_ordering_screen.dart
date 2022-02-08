import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/enums.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/widgets/favorite_button_with_number.dart';

class MarketsOrderingScreen extends StatefulWidget {
  const MarketsOrderingScreen({Key? key}) : super(key: key);

  @override
  State<MarketsOrderingScreen> createState() => _MarketsOrderingScreenState();
}

class _MarketsOrderingScreenState extends State<MarketsOrderingScreen> {

  MarketOrderingScreenRadioValues? _character = MarketOrderingScreenRadioValues.bestSeller;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        centerTitle: true,
        title: DefaultText(
          textStyle: Theme.of(context).textTheme.headline5,
          text: 'ترتيب الأسر',
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
                    icon: Image.asset('assets/icons/sort.png')),

                ListTile(
                  title: const Text('الأكثر مبيعا'),
                  leading: Radio<MarketOrderingScreenRadioValues>(
                    value: MarketOrderingScreenRadioValues.bestSeller,
                    groupValue: _character,
                    onChanged: (MarketOrderingScreenRadioValues? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('الأكثر تقيما'),
                  leading: Radio<MarketOrderingScreenRadioValues>(
                    value: MarketOrderingScreenRadioValues.mostRated,
                    groupValue: _character,
                    onChanged: (MarketOrderingScreenRadioValues? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('من الأحدث للأقدم'),
                  leading: Radio<MarketOrderingScreenRadioValues>(
                    value: MarketOrderingScreenRadioValues.newest,
                    groupValue: _character,
                    onChanged: (MarketOrderingScreenRadioValues? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(

                  title: const Text('من الأقدم للأحدث'),
                  leading: Radio<MarketOrderingScreenRadioValues>(
                    value: MarketOrderingScreenRadioValues.oldest,
                    groupValue: _character,
                    onChanged: (MarketOrderingScreenRadioValues? value) {
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
