import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class DeliveryRepresentativeOrderSentBottomSheet extends StatelessWidget {
  const DeliveryRepresentativeOrderSentBottomSheet({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, DELIVERY_REPRESENTATIVE_SHOP_LAYOUT, (route) => false);
        return true;
      },
      child: Container(

        padding: const EdgeInsetsDirectional.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(36), topStart: Radius.circular(36))),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/order_sent_green_check.svg',
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 24,),
            DefaultText(
                text: 'تهانينا',
                textStyle: Theme.of(context).textTheme.bodyText1)
          ],
        ),
      ),
    );
  }
}
