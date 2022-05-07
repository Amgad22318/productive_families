import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/order/payment_summary_item.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/order/show_order_screen_item.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/payment_summary/payment_summary_item.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/widgets/dotted_line_seperator.dart';

import '../../../../business_logic/user/show_order/user_show_order_cubit.dart';
import '../../../../data/models/user_models/orders/user_show_order_model.dart';
import '../../../widgets/default_error_widget.dart';
import '../../../widgets/default_loading_indicator.dart';
import '../../../widgets/default_material_button.dart';

class UserShowOrderScreen extends StatefulWidget {
  final int orderId;

  const UserShowOrderScreen({Key? key, required this.orderId})
      : super(key: key);

  @override
  State<UserShowOrderScreen> createState() => _UserShowOrderScreenState();
}

class _UserShowOrderScreenState extends State<UserShowOrderScreen> {
  late UserShowOrderCubit userShowOrderCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserShowOrderCubit()..showOrder(orderId: widget.orderId),
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
                Navigator.pop(context);
              },
            )
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
              child: BlocBuilder<UserShowOrderCubit, UserShowOrderState>(
                builder: (context, state) {
                  if (state is UserShowOrderSuccessState) {
                    userShowOrderCubit = UserShowOrderCubit.get(context);
                    OrderDetails orderDetails=  userShowOrderCubit.userShowOrderModel.orderDetails;
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) =>
                                ShowOrderScreenItem(
                                    orderProductModel: userShowOrderCubit
                                        .userShowOrderModel
                                        .orderProducts[index]),
                            itemCount: userShowOrderCubit
                                .userShowOrderModel.orderProducts.length,
                          ),
                        ),
                        PaymentSummaryItem(
                          children: [
                            DefaultText(
                              text: 'ملخص الدفع',
                              textStyle: Theme.of(context).textTheme.bodyText1,
                              color: const Color(0xFF9FBBEB),
                            ),
                             PaymentSummaryInnerItem(
                                text: 'تكلفة الدفع:', price:orderDetails.orderPrice==0?'0': '+ ${orderDetails.orderPrice}'),
                             PaymentSummaryInnerItem(
                                text: 'الضريبه المضافه:', price:orderDetails.vat==0?'0': '+ ${orderDetails.vat}'),
                             PaymentSummaryInnerItem(
                                text: 'رسوم الشحن:', price:orderDetails.driverCost==0?'0': '+ ${orderDetails.driverCost}'),
                             PaymentSummaryInnerItem(
                                text: 'كود الخصم:', price:orderDetails.voucherDiscount==0?'0':  '- ${orderDetails.voucherDiscount}'),
                            const Padding(
                              padding: EdgeInsetsDirectional.only(
                                  end: 8.0, start: 8.0),
                              child: DottedLineSeparator(),
                            ),
                             PaymentSummaryInnerItem(
                                text: 'السعر الكلى:', price: orderDetails.netPrice.toString()),
                          ],
                        ),
                      ],
                    );
                  } else if (state is UserShowOrderLoadingState) {
                    return const DefaultLoadingIndicator();
                  } else {
                    return const DefaultErrorWidget();
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 15, right: 20, left: 20, top: 20),
              child: DefaultMaterialButton(
                onPressed: () {},
                text: 'تتبع الطلب',
              ),
            )
          ],
        ),
      ),
    );
  }
}
