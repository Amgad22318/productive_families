import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/order/order_product_checkout_item.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/order/payment_summary_item.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/payment_summary/payment_summary_item.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/widgets/dotted_line_seperator.dart';

import '../../../../business_logic/user/order_checkout_product/user_order_checkout_product_cubit.dart';
import '../../../../data/models/user_models/orders/user_order_show_check_out_products_model.dart';
import '../../../widgets/default_error_widget.dart';
import '../../../widgets/default_loading_indicator.dart';

class OrderProductsCheckOutScreen extends StatefulWidget {
  final int orderId;

  const OrderProductsCheckOutScreen({Key? key, required this.orderId})
      : super(key: key);

  @override
  State<OrderProductsCheckOutScreen> createState() =>
      _OrderProductsCheckOutScreenState();
}

class _OrderProductsCheckOutScreenState
    extends State<OrderProductsCheckOutScreen> {
  late UserOrderCheckoutProductCubit _userOrderCheckoutProductCubit;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context)
          ..pop()
          ..pop();
        return true;
      },
      child: BlocProvider(
        create: (context) => UserOrderCheckoutProductCubit()
          ..getCheckOutProducts(orderId: widget.orderId),
        child: Scaffold(
          appBar: DefaultShopAppbar(
            height: 80,
            centerTitle: true,
            actions: [
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/back_arrow.svg",
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                      ..pop()
                      ..pop();
                  })
            ],
            title: const DefaultText(
              text: 'تفاصيل الطلب',
              textStyle: TextStyle(),
            ),
          ),
          body: Column(
            children: [
              const Image(
                  image: AssetImage('assets/image/appbar_half_circle.png')),
              Expanded(
                child: BlocConsumer<UserOrderCheckoutProductCubit,
                    UserOrderCheckoutProductState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    if (state is UserGetOrderProductCheckoutSuccessState) {
                      _userOrderCheckoutProductCubit =
                          UserOrderCheckoutProductCubit.get(context);

                      List<OrderProducts> orderProducts =
                          _userOrderCheckoutProductCubit
                              .userOrderShowCheckOutProductsModel.orderProducts;

                      OrderDetails orderDetails=   _userOrderCheckoutProductCubit
                          .userOrderShowCheckOutProductsModel.orderDetails;
                      return Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) => OrderProductCheckOutListItem(
                                  orderProductModel: orderProducts[index]),
                              itemCount: orderProducts.length,
                            ),
                          ),
                          PaymentSummaryItem(
                            children: [
                              DefaultText(
                                text: 'ملخص الدفع',
                                textStyle:
                                    Theme.of(context).textTheme.bodyText1,
                                color: const Color(0xFF9FBBEB),
                              ),
                              PaymentSummaryInnerItem(
                                  text: 'تكلفة الدفع:',
                                  price: orderDetails.orderPrice == 0
                                      ? '0'
                                      : '+ ${orderDetails.orderPrice}'),
                              PaymentSummaryInnerItem(
                                  text: 'الضريبه المضافه:',
                                  price: orderDetails.vat == 0
                                      ? '0'
                                      : '+ ${orderDetails.vat}'),
                              PaymentSummaryInnerItem(
                                  text: 'رسوم الشحن:',
                                  price: orderDetails.driverCost == 0
                                      ? '0'
                                      : '+ ${orderDetails.driverCost}'),
                              PaymentSummaryInnerItem(
                                  text: 'كود الخصم:',
                                  price: orderDetails.voucherDiscount == 0
                                      ? '0'
                                      : '- ${orderDetails.voucherDiscount}'),
                              const Padding(
                                padding: EdgeInsetsDirectional.only(
                                    end: 8.0, start: 8.0),
                                child: DottedLineSeparator(),
                              ),
                              PaymentSummaryInnerItem(
                                  text: 'السعر الكلى:',
                                  price: orderDetails.netPrice.toString()),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 20, right: 20, left: 20, top: 30),
                            child: DefaultMaterialButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, USER_ORDER_TRACKS_SCREEN, (route) => false,arguments:orderDetails.id );
                              },
                              text: 'تأكيد الطلب',
                            ),
                          )
                        ],
                      );
                    }
                    else if (state is UserGetOrderProductCheckoutLoadingState) {
                      return const DefaultLoadingIndicator();
                    } else {
                      return const DefaultErrorWidget();
                    }
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
