import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/market_owner_screen_views/order_follow_up_bottom_sheet/mo_order_tracking_bottom_sheet.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/order/order_follow_up_item.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class MarketOwnerOrderFollowUp extends StatelessWidget {
  const MarketOwnerOrderFollowUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, MARKET_OWNER_SHOP_LAYOUT, (route) => false);
        return true;
      },
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
                  Navigator.pushNamedAndRemoveUntil(
                      context, MARKET_OWNER_SHOP_LAYOUT, (route) => false);
                })
          ],
          title: const DefaultText(
            text: 'متابعة الطلب',
            textStyle: TextStyle(),
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          Color(0xFFFFDC2A),
                          Color(0xFFFFF2B3),
                        ],
                      ),
                    ),
                    // child: const Center(child: Text('map')),
                  ),
                ),
                Expanded(
                  flex: 15,
                  child: Container(
                    color: Colors.white,

                    // child: const Center(child: Text('map')),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/icons/clock.svg",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultText(
                      text: '45 min',
                      textStyle: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(
                    height: 5,
                  ),
                  DefaultText(
                      text: 'ميعاد التوصيل',
                      textStyle: Theme.of(context).textTheme.bodyText1),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Stack(
                        alignment: AlignmentDirectional.centerStart,
                        children: [
                          Positioned.fill(
                            bottom: 25,
                            top: 25,
                            right: 19,
                            child: SvgPicture.asset(
                              "assets/icons/Line.svg",
                              color: orderFollowUpGreyCheck,
                              fit: BoxFit.fitHeight,
                              alignment: AlignmentDirectional.centerStart,
                            ),
                          ),
                          Column(
                            children: [
                              OrderFollowUpItem(
                                text: 'تم الموافقه على الطلب',
                                date: '02:00 pm',
                                isDone: true,
                              ),
                              OrderFollowUpItem(
                                text: 'الطلب قيد التحضير',
                                date: '02:00 pm',
                                isDone: true,
                              ),
                              OrderFollowUpItem(
                                text: 'الطلب قيد التوصيل',
                                date: '02:00 pm',
                                isDone: false,
                              ),
                              OrderFollowUpItem(
                                text: 'تم توصيل الطلب',
                                date: '02:00 pm',
                                isDone: false,
                              ),
                              OrderFollowUpItem(
                                text: 'تم توصيل الطلب',
                                date: '02:00 pm',
                                isDone: false,
                              ),
                              OrderFollowUpItem(
                                text: 'تم توصيل الطلب',
                                date: '02:00 pm',
                                isDone: false,
                              ),
                            ],
                          ),
                        ],
                        //
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40.0, horizontal: 20),
                    child: DefaultMaterialButton(
                      onPressed: () {
                        showModalBottomSheet(
                            shape:const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                              ),
                            ),
                            context: context,
                            builder: (BuildContext constext) {
                              return MarketOwnerOrderTrackingBottomSheet();
                            });
                      },
                      text: 'التالى',
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
