import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class OrderLocation extends StatelessWidget {
  OrderLocation({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
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
          text: 'متابعة الطلب',
          textStyle: TextStyle(),
        ),
      ),
      body: Stack(
        children: [

          SizedBox(
            height: size.height*0.9,
            width: double.maxFinite,
            // map location
            child: const Image(image: AssetImage('assets/image/map.png'),
              fit: BoxFit.fill,),

          ),
          Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,mainAxisSize: MainAxisSize.max,
            children: [
              const Center(
                  child: Image(
                      image: AssetImage('assets/image/appbar_half_circle.png'))),

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                      color: darkBlue,
                    ),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultMaterialButton(
                                text: 'استملت الطلب',
                                onPressed: () {},
                                height: size.height * 0.06,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      )
    );
  }
}
