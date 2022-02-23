import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/payment_summary/payment_summary_inner_item.dart';
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
      padding:const EdgeInsets.only(bottom: 25,left: 30,right: 30,top: 10),
      width: double.infinity,
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultText(
            text: 'ملخص الدفع',
            textStyle: Theme.of(context).textTheme.headline6,
            color:const Color(0xFF9FBBEB),
          ),
         const SizedBox(
            height: 10,
          ),
          const PaymentSummaryInnerItem(text: 'تكلفة الدفع', price: '279.00\$'),
          const PaymentSummaryInnerItem(text: 'الضريبه المضافه:', price: '10.00\$'),
          const PaymentSummaryInnerItem(text: 'رسوم الشحن:', price: '10.00\$'),
          const PaymentSummaryInnerItem(text: 'كود الخصم:', price: '10.00\$'),





          const  Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: DottedLineSeparator(),
          ),
          PaymentSummaryInnerItem(text:  'السعر الكلى:', price: '299.00\$'),
        ],
      ),
    );
  }
}
