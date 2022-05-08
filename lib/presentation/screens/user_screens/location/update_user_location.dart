import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

import '../../../../constants/constants.dart';
import '../../../widgets/default_map.dart';

class UpdateUserLocation extends StatefulWidget {
  UpdateUserLocation({Key? key}) : super(key: key);

  @override
  State<UpdateUserLocation> createState() => _UpdateUserLocationState();
}

class _UpdateUserLocationState extends State<UpdateUserLocation> {
   double? clickedMarkerLat;

   double? clickedMarkerLng;

  final Completer<GoogleMapController> _controller = Completer();

  final TextEditingController specifyLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        height: 80,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {Navigator.pop(context);},
            icon: SvgPicture.asset(
              "assets/icons/back_arrow.svg",
              color: Colors.black,
            ),
          )
        ],
        title: const DefaultText(
          text: 'تحديد العنوان',
          textStyle: TextStyle(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                    child: DefaultMap(
                      onTap: (argument) {
                        setState(() {
                          clickedMarkerLat = argument.latitude;
                          clickedMarkerLng = argument.longitude;
                        });
                      },
                      initialCameraPosition: AppInitialCameraPosition,
                      markers: {
                        Marker(
                            markerId: const MarkerId('chosenLocation'),
                            infoWindow:
                            const InfoWindow(title: 'الموقع المختار'),
                            position:
                            LatLng(clickedMarkerLat??0.0, clickedMarkerLng??0.0)),
                      },
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    )),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Image(
                      image: AssetImage(
                          'assets/image/appbar_half_circle.png')),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                color: darkBlue,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ادخل موقعك الحالى',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          DefaultFormField(
                              hintText: '',
                              prefixIcon:  const Icon(Icons.location_on_outlined,color: Colors.white),
                              controller: specifyLocationController,
                              validator: (p0) {},
                              keyboardType: TextInputType.text),
                          const SizedBox(height: 15),
                          DefaultMaterialButton(
                            text: 'تحديد العنوان',
                            onPressed: () {
                              Navigator.pop(context);
                            },
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
