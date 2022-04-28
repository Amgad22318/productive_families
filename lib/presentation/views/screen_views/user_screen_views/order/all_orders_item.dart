import 'package:flutter/material.dart';
import 'package:productive_families/business_logic/user/all_orders/user_all_orders_cubit.dart';
import 'package:productive_families/constants/constants.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/models/user_models/orders/user_all_orders_model.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_cached_network_image.dart';
import 'package:productive_families/presentation/widgets/default_outlined_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

class AllOrdersItem extends StatefulWidget {
  final Orders orderModel;
  final int itemIndex;
  final UserAllOrdersCubit userAllOrdersCubit;

  const AllOrdersItem(
      {Key? key,
      required this.orderModel,
      required this.userAllOrdersCubit,
      required this.itemIndex})
      : super(key: key);

  @override
  State<AllOrdersItem> createState() => _AllOrdersItemState();
}

class _AllOrdersItemState extends State<AllOrdersItem> {
  late Color statusColor = Colors.red;

  @override
  void initState() {
    if (widget.orderModel.status == 'waiting' ||
        widget.orderModel.status == 'processing' ||
        widget.orderModel.status == 'acceptedByDriver' ||
        widget.orderModel.status == 'onTheWay' ||
        widget.orderModel.status == 'delivered') {
      statusColor = backGroundAccentYellow;
    } else if (widget.orderModel.status == 'canceled' ||
        widget.orderModel.status == 'refused' ||
        widget.orderModel.status == 'timeout') {
      statusColor = backGroundRed;
    } else if (widget.orderModel.status == 'finished') {
      statusColor = backGroundGreen;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double textScale = MediaQuery.textScaleFactorOf(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: const BorderSide(color: defaultYellow, width: 1.0)),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, USER_SHOW_ORDER_SCREEN,arguments: widget.orderModel.id);
          },
          child: LimitedBox(
            maxHeight: 21.h * textScale,
            child: Row(
              children: [
                Flexible(
                  flex: 30,
                  child: SizedBox.expand(
                    child: DefaultCachedNetworkImage(
                      imageUrl: widget.orderModel.apiImage.path,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: DefaultText(
                                text: widget.orderModel.serviceName,
                                textStyle:
                                    Theme.of(context).textTheme.bodyText2,
                                // textStyle: TextStyle(),
                              ),
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: statusColor,
                                  radius: 5,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                DefaultText(
                                  text: widget.orderModel.statusString,
                                  color: statusColor,
                                  textStyle: const TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DefaultText(
                                    text: 'السعر الكلى',
                                    textStyle:
                                        Theme.of(context).textTheme.caption,
                                  ),
                                  DefaultText(
                                    text: widget.orderModel.orderPrice
                                            .toString() +
                                        " $AppCurrencyShortcut",
                                    textStyle:
                                        Theme.of(context).textTheme.caption,
                                    color: defaultYellow,
                                  ),
                                ],
                              ),
                            ),
                            if (widget.orderModel.status == 'waiting') ...[
                              Flexible(
                                flex: 1,
                                child: DefaultOutlinedButton(
                                  fontSize: 12,
                                  height: 32,
                                  onPressed: () {
                                    widget.userAllOrdersCubit.cancelOrder(
                                        orderId: widget.orderModel.id,
                                        itemIndex: widget.itemIndex);
                                  },
                                  text: 'إلغاء',
                                ),
                              ),
                            ]
                          ],
                        ),
                        DefaultText(
                          text: widget.orderModel.note,
                          textStyle: Theme.of(context).textTheme.caption,
                          color: greyText,
                          maxLines: 3,
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
