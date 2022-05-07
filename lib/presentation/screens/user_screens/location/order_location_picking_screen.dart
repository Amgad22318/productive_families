import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

import '../../../../business_logic/user/start_order_process_and_order_location/user_start_order_process_and__order_location_cubit.dart';
import '../../../../constants/constants.dart';
import '../../../widgets/default_form_field.dart';
import '../../../widgets/default_map.dart';

class OrderLocationPickingScreen extends StatefulWidget {
  final UserStartOrderProcessAndOrderLocationCubit
      userStartOrderProcessAndOrderLocationCubit;

  const OrderLocationPickingScreen(
      {Key? key, required this.userStartOrderProcessAndOrderLocationCubit})
      : super(key: key);

  @override
  State<OrderLocationPickingScreen> createState() =>
      _OrderLocationPickingScreenState();
}

class _OrderLocationPickingScreenState
    extends State<OrderLocationPickingScreen> {
  late double clickedMarkerLat;
  late double clickedMarkerLng;
  final Completer<GoogleMapController> _controller = Completer();
  final TextEditingController SpecifyLocationController = TextEditingController();


  @override
  void initState() {
    clickedMarkerLat = 0;
    clickedMarkerLng = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.userStartOrderProcessAndOrderLocationCubit,
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
                  })
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
                                LatLng(clickedMarkerLat, clickedMarkerLng)),
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
                                  controller: SpecifyLocationController,
                                  validator: (p0) {},
                                  keyboardType: TextInputType.text),
                              const SizedBox(height: 15),
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
          )),
    );
  }
}
