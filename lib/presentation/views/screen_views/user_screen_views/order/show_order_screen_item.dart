import 'package:flutter/material.dart';
import 'package:productive_families/constants/constants.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/constants/weights.dart';
import 'package:productive_families/data/models/user_models/orders/user_show_order_model.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/order/order_details_bottom_sheet.dart';
import 'package:productive_families/presentation/widgets/default_cached_network_image.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/widgets/default_text_button.dart';
import 'package:sizer/sizer.dart';

class ShowOrderScreenItem extends StatelessWidget {
  final OrderProducts orderProductModel;
  const ShowOrderScreenItem({Key? key, required this.orderProductModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double textScale = MediaQuery.textScaleFactorOf(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, USER_ABOUT_PRODUCT,
              arguments: orderProductModel.id);
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                const Spacer(),
                Expanded(
                  flex: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: DefaultText(
                                  text: orderProductModel.name,
                                  fontWeight: FontWeights.bold,
                                  fontSize: 14.sp,

                                  // textStyle: TextStyle(),
                                ),
                              ),
                              DefaultTextButton(
                                text: 'قيم المنتج',
                                textStyle: Theme.of(context).textTheme.button,
                                onPressed: () {
                                  showModalBottomSheet(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(32),
                                        topRight: Radius.circular(32),
                                      )),
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) =>
                                          OrderDetailsBottomSheet());
                                },
                                textColor: darkBlue,
                              )
                            ],
                          ),
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
