import 'package:flutter/material.dart';
import 'package:productive_families/data/models/user_models/orders/user_order_show_check_out_products_model.dart';

import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../../../../constants/constants.dart';
import '../../../../../constants/weights.dart';
import '../../../../widgets/default_cached_network_image.dart';

class OrderProductCheckOutListItem extends StatelessWidget {
  final OrderProducts orderProductModel;
  const OrderProductCheckOutListItem( { Key? key, required this.orderProductModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double textScale = MediaQuery.textScaleFactorOf(context);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: LimitedBox(
          maxHeight: 18.h * textScale,

          child: Row(
            children: [
              Flexible(
                  flex: 30,
                  child: SizedBox.expand(
                      child: DefaultCachedNetworkImage(
                          imageUrl: orderProductModel.image.path,
                          fit: BoxFit.cover))),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: orderProductModel.name,
                      fontWeight: FontWeights.bold,
                      fontSize: 14.sp,
                      // textStyle: TextStyle(),
                    ),
                    DefaultText(
                      text:
                      "${orderProductModel.quantity}X${orderProductModel.price}"
                          " $AppCurrencyShortcut",
                      fontSize: 12.sp,
                      fontWeight: FontWeights.bold,
                      color: defaultYellow,
                    ),
                    DefaultText(
                      text: orderProductModel.description,
                      textStyle: TextStyle(fontSize: 10.sp),
                      maxLines: 2,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
