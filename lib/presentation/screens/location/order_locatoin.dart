import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class OrderLocation extends StatelessWidget {
  OrderLocation({Key? key}) : super(key: key);

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
          text: 'متابعة الطلب',
          textStyle: TextStyle(),
        ),
      ),
      body: Stack(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                color: Colors.white30,
                child: const  Image(
                  image: AssetImage('assets/image/map.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,mainAxisSize: MainAxisSize.max,
            children: [
              const Center(
                  child: Image(
                      image: AssetImage('assets/image/appbar_half_circle.png'))),
            ],
          ),
        ],
      )
    );
  }
}
