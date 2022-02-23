import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/payment_summary/payment_summary_item.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/widgets/dotted_line_seperator.dart';

class PaymentSummaryItem extends StatelessWidget {
  final List<Widget> children;
  const PaymentSummaryItem({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: defaultYellow.withOpacity(0.3),
      ),
      padding:const EdgeInsets.only(bottom: 10,left: 30,right: 30,top: 10),
      width: double.infinity,
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: children
      ),
    );
  }
}
