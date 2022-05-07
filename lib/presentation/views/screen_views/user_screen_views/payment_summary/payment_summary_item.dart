import 'package:flutter/material.dart';
import 'package:productive_families/constants/constants.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class PaymentSummaryInnerItem extends StatelessWidget {
  final String text;
  final String price;

   const PaymentSummaryInnerItem({required this.text,required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DefaultText(
            text: text,
            textStyle: Theme.of(context).textTheme.caption),
        DefaultText(

          text: price+' $AppCurrencyShortcut',
          textStyle: Theme.of(context).textTheme.caption!.copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
