import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/constants/enums.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/order/payment_summary_item.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/payment_summary/payment_summary_item.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/widgets/dotted_line_seperator.dart';
import 'package:sizer/sizer.dart';

import '../../../../data/models/user_models/orders/user_start_order_process_model.dart';
import '../../../widgets/default_map.dart';

class OrderAddressConfirmationScreen extends StatefulWidget {
  final OrderDetails orderDetails;
  const OrderAddressConfirmationScreen({Key? key,required this.orderDetails}) : super(key: key);

  @override
  State<OrderAddressConfirmationScreen> createState() =>
      _OrderAddressConfirmationScreenState();
}

class _OrderAddressConfirmationScreenState
    extends State<OrderAddressConfirmationScreen> {
  final Completer<GoogleMapController> _controller = Completer();
   late double clickedMarkerLat;
   late double clickedMarkerLng;
  late CameraPosition initialCameraPosition;
  @override
  void initState() {
    initialCameraPosition=CameraPosition(
      target: LatLng(widget.orderDetails.toLocation.lat.toDouble(), widget.orderDetails.toLocation.lon.toDouble()),
      zoom: 9,
    );
    clickedMarkerLat=widget.orderDetails.toLocation.lat.toDouble();
    clickedMarkerLng=widget.orderDetails.toLocation.lon.toDouble();
    super.initState();
  }


  OrderAddressConfirmationRadioValues? _character =
      OrderAddressConfirmationRadioValues.paypal;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
              })
        ],
        title: const DefaultText(
          text: 'تفاصيل الطلب',
          textStyle: TextStyle(),
        ),
      ),
      body: Column(
        children: [
          const Image(image: AssetImage('assets/image/appbar_half_circle.png')),
          Expanded(
            child: ListView(
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0,vertical: 20),
                  child:  SizedBox(
                    height: 30.h,width: 80.w,
                    child: DefaultMap(
                      initialCameraPosition:  initialCameraPosition,
                      markers: {
                         Marker(
                            markerId: const MarkerId('chosenLocation'),
                            infoWindow:
                            const InfoWindow(title: 'الموقع المختار',),
                            position:
                            LatLng(clickedMarkerLat, clickedMarkerLng)),
                      },
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                        Factory<OneSequenceGestureRecognizer>(
                              () =>  EagerGestureRecognizer(),
                        ),
                      },
                    ),
                  )
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: DefaultText(
                    text: 'العنوان',
                    textStyle: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: DefaultText(
                    text:
                       widget.orderDetails.toLocation.address,
                    color: greyText,
                    maxLines: 4,
                    textStyle: Theme.of(context).textTheme.caption,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: defaultYellow.withOpacity(0.3),
                  ),
                  padding: const EdgeInsets.only(
                      bottom: 10, left: 30, right: 30, top: 10),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        text: 'طريقة الدفع',
                        textStyle: Theme.of(context).textTheme.headline6,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 10,
                            child: ListTile(
                             title: SvgPicture.asset('assets/icons/paypal.svg',),
                              leading:
                                  Radio<OrderAddressConfirmationRadioValues>(
                                value:
                                    OrderAddressConfirmationRadioValues.paypal,
                                groupValue: _character,
                                onChanged: (OrderAddressConfirmationRadioValues?
                                    value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),

                            ),
                          ),
                          const Spacer(
                            flex: 1
                          ),
                          Expanded(
                            flex: 10,
                            child: ListTile(
                              title: SvgPicture.asset('assets/icons/shop_pay.svg',width: 55,height: 55,),
                              leading:
                                  Radio<OrderAddressConfirmationRadioValues>(
                                value:
                                    OrderAddressConfirmationRadioValues.shopPay,
                                groupValue: _character,
                                onChanged: (OrderAddressConfirmationRadioValues?
                                    value) {
                                  setState(() {
                                    _character = value;

                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                 PaymentSummaryItem(children: [
                   DefaultText(
                     text: 'ملخص الدفع',
                     textStyle: Theme.of(context).textTheme.bodyText1,
                     color:const Color(0xFF9FBBEB),
                   ),
                   PaymentSummaryInnerItem(
                       text: 'تكلفة الدفع:', price:widget.orderDetails.orderPrice==0?'0': '+ ${widget.orderDetails.orderPrice}'),
                   PaymentSummaryInnerItem(
                       text: 'الضريبه المضافه:', price:widget.orderDetails.vat==0?'0': '+ ${widget.orderDetails.vat}'),
                   PaymentSummaryInnerItem(
                       text: 'رسوم الشحن:', price:widget.orderDetails.driverCost==0?'0': '+ ${widget.orderDetails.driverCost}'),
                   PaymentSummaryInnerItem(
                       text: 'كود الخصم:', price:widget.orderDetails.voucherDiscount==0?'0':  '- ${widget.orderDetails.voucherDiscount}'),
                   const Padding(
                     padding: EdgeInsetsDirectional.only(
                         end: 8.0, start: 8.0),
                     child: DottedLineSeparator(),
                   ),
                   PaymentSummaryInnerItem(
                       text: 'السعر الكلى:', price: widget.orderDetails.netPrice.toString()),
                 ],),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 20, right: 20, left: 20, top: 30),
                  child: DefaultMaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ORDER_PRODUCTS_CHECKOUT_SCREEN,arguments: widget.orderDetails.id);
                    },
                    text: 'تأكيد الطلب',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
