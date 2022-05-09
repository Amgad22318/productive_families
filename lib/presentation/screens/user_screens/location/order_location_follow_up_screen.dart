import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

import '../../../../constants/constants.dart';
import '../../../widgets/default_map.dart';
class OrderLocationFollowUpScreen extends StatefulWidget {
  const OrderLocationFollowUpScreen({Key? key}) : super(key: key);

  @override
  State<OrderLocationFollowUpScreen> createState() => _OrderLocationFollowUpScreenState();
}

class _OrderLocationFollowUpScreenState extends State<OrderLocationFollowUpScreen> {

  late double clickedMarkerLat;
  late double clickedMarkerLng;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Completer<GoogleMapController> _controller = Completer();


  @override
  void initState() {
    clickedMarkerLat = 0;
    clickedMarkerLng = 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(child:DefaultMap(

                    initialCameraPosition: AppInitialCameraPosition,
                    markers: {
                      Marker(
                          markerId:
                          const MarkerId('chosenLocation'),
                          infoWindow: const InfoWindow(
                              title: 'الموقع المختار'),
                          position: LatLng(clickedMarkerLat,
                              clickedMarkerLng)),
                    },
                    onMapCreated:
                        (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  )
                  ),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                        image: AssetImage(
                            'assets/image/appbar_half_circle.png')),
                  ),
                ],
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,mainAxisSize: MainAxisSize.max,
              children: [


                Container(
                  color: darkBlue,

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
        )
    );
  }
}
