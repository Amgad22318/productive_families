import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class MarketOwnerOrderTrackingBottomSheet extends StatelessWidget {
  const MarketOwnerOrderTrackingBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Wrap(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  const Image(image: AssetImage('assets/image/order_done.png'),width: 100,height: 100,),
                  const SizedBox(height: 15,),
                  DefaultText(
                    text: 'تم إنهاء الطلب بنجاح',
                    textStyle: Theme.of(context).textTheme.headline6,
                  )
                ],
              )),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 30.0),
            child: DefaultMaterialButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, MARKET_OWNER_SHOP_LAYOUT, (route) => false);
              },
              text: 'العوده للرئيسيه',
            ),
          ),
        ],
      ),
    );
  }
}
