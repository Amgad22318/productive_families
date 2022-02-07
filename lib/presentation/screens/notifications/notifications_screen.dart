import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/app_notification_item.dart';
import 'package:productive_families/presentation/views/display_representative_price_item.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_splitter_builder.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/widgets/dotted_line_seperator.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: DefaultShopAppbar(
          height: 80,
          centerTitle: true,
          actions: [
            GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SvgPicture.asset(
                    "assets/icons/back_arrow.svg",
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                })
          ],
          title: const DefaultText(
            text: 'الإشعارات',
            textStyle: TextStyle(),
          ),
        ),
        body: Column(
          children: [
            const Image(
                image: AssetImage('assets/image/appbar_half_circle.png')),
            SizedBox(
              height: size.height * 0.025,
            ),
            Expanded(
              child: ListView(
                children:const [
                  AppNotificationItem(),
                  SizedBox(
                    height: 10,
                  ),
                  DisplayRepresentativePriceItem(),
                  SizedBox(
                    height: 10,
                  ),AppNotificationItem(),
                  SizedBox(
                    height: 10,
                  ),
                  DisplayRepresentativePriceItem(),
                  SizedBox(
                    height: 10,
                  ),AppNotificationItem(),
                  SizedBox(
                    height: 10,
                  ),
                  DisplayRepresentativePriceItem(),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
