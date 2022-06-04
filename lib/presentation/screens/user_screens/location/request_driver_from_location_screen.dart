import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:productive_families/business_logic/user/request_driver/user_request_driver_cubit.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/enums.dart';
import '../../../widgets/default_map.dart';

class RequestDriverFromLocationScreen extends StatefulWidget {
  final UserRequestDriverCubit userRequestDriverCubit;

  const RequestDriverFromLocationScreen(
      {Key? key, required this.userRequestDriverCubit})
      : super(key: key);

  @override
  State<RequestDriverFromLocationScreen> createState() =>
      _RequestDriverFromLocationScreenState();
}

class _RequestDriverFromLocationScreenState
    extends State<RequestDriverFromLocationScreen> {
  double? clickedMarkerLat;

  double? clickedMarkerLng;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        height: 80,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              "assets/icons/back_arrow.svg",
              color: Colors.black,
            ),
          )
        ],
        title: const DefaultText(
          text: 'مندوب التوصيل',
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
                      widget.userRequestDriverCubit.getFromAddress(
                          lat: clickedMarkerLat!, lon: clickedMarkerLng!);
                    },
                    initialCameraPosition: AppInitialCameraPosition,
                    markers: clickedMarkerLat == null ||
                            clickedMarkerLng == null
                        ? {}
                        : {
                            Marker(
                                markerId: const MarkerId('chosenLocation'),
                                infoWindow:
                                    const InfoWindow(title: 'الموقع المختار'),
                                position: LatLng(
                                    clickedMarkerLat!, clickedMarkerLng!)),
                          },
                  ),
                ),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Image(
                      image: AssetImage('assets/image/appbar_half_circle.png')),
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
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'أدخل الموقع',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          // DefaultMaterialButton(text: 'text', onPressed: () {}),
                          DefaultFormField(
                              hintText: '',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(
                                  'assets/icons/location.svg',
                                  color: Colors.white,
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                              controller: widget.userRequestDriverCubit
                                  .fromLocationController,
                              keyboardType: TextInputType.text),
                          const SizedBox(height: 15),
                          DefaultMaterialButton(
                            text: 'تأكيد العنوان',
                            onPressed: () {
                              if (clickedMarkerLat == null ||
                                  clickedMarkerLng == null) {
                                showToastMsg(
                                    msg: 'اختر العنوان',
                                    toastState: ToastStates.ERROR);
                              } else {
                                Navigator.pop(context);
                              }
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
      ),
    );
  }
}
