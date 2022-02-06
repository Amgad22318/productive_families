import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/widgets/dotted_line_seperator.dart';

class PaymentSummaryItem extends StatelessWidget {
  const PaymentSummaryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: defaultYellow.withOpacity(0.3),
      ),
      padding: EdgeInsets.only(bottom: 25,left: 30,right: 30,top: 10),
      width: double.infinity,
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultText(
            text: 'ملخص الدفع',
            textStyle: Theme.of(context).textTheme.headline6,
            color: Color(0xFF9FBBEB),
          ),
         const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultText(
                  text: 'تكلفة الدفع',
                  textStyle: Theme.of(context).textTheme.bodyText1),
              DefaultText(
                text: '279.00\$',
                textStyle: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultText(
                  text: 'الضريبه المضافه:',
                  textStyle: Theme.of(context).textTheme.bodyText1),
              DefaultText(
                text: '10.00\$',
                textStyle: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultText(
                  text: 'رسوم الشحن:',
                  textStyle: Theme.of(context).textTheme.bodyText1),
              DefaultText(
                text: '10.00\$',
                textStyle: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultText(
                  text: 'كود الخصم:',
                  textStyle: Theme.of(context).textTheme.bodyText1),
              DefaultText(
                text: '10.00\$',
                textStyle: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ),

          const  Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: DottedLineSeparator(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultText(
                  text: 'السعر الكلى:',
                  textStyle: Theme.of(context).textTheme.bodyText1),
              DefaultText(
                text: '299.00\$',
                textStyle: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ),
        ],
      ),
    );
  }
}
