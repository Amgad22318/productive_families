import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:productive_families/business_logic/user/update_user_location/update_user_location_cubit.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

import '../../../../business_logic/user/local/user_local_cubit.dart';
import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/enums.dart';
import '../../../widgets/default_map.dart';

class UpdateUserLocation extends StatefulWidget {
  final UserLocalCubit userLocalCubit;

  const UpdateUserLocation({Key? key, required this.userLocalCubit})
      : super(key: key);

  @override
  State<UpdateUserLocation> createState() => _UpdateUserLocationState();
}

class _UpdateUserLocationState extends State<UpdateUserLocation> {
  double? clickedMarkerLat;

  double? clickedMarkerLng;

  final Completer<GoogleMapController> _controller = Completer();

late UpdateUserLocationCubit _updateUserLocationCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => UpdateUserLocationCubit(),
      child: Scaffold(
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
              text: 'تحديد العنوان',
              textStyle: TextStyle(),
            ),
          ),
          body: Builder(
            builder: (context) {
              _updateUserLocationCubit=UpdateUserLocationCubit.get(context);
              return BlocListener<UpdateUserLocationCubit, UpdateUserLocationState>(
                listener: (context, state) {
                  if (state
                  is UserUpdateAddressSuccessState) {
                    showToastMsg(
                        msg: state.message,
                        toastState: ToastStates.SUCCESS);
                    widget.userLocalCubit
                        .getUserProfileData();
                    Navigator.pop(context);
                  } else if (state
                  is UserUpdateAddressErrorState) {
                    showToastMsg(
                        msg: state.message,
                        toastState: ToastStates.ERROR);
                  }
                },
                child: Column(
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
                                  _updateUserLocationCubit.getAddress(
                                      lat: clickedMarkerLat!,
                                      lon: clickedMarkerLng!);
                                },
                                initialCameraPosition: AppInitialCameraPosition,
                                markers: {
                                  Marker(
                                      markerId: const MarkerId('chosenLocation'),
                                      infoWindow: const InfoWindow(
                                          title: 'الموقع المختار'),
                                      position: LatLng(clickedMarkerLat ?? 0.0,
                                          clickedMarkerLng ?? 0.0)),
                                },
                                onMapCreated: (GoogleMapController controller) {
                                  _controller.complete(controller);
                                },
                              )),
                          const Align(
                            alignment: Alignment.topCenter,
                            child: Image(
                                image:
                                AssetImage('assets/image/appbar_half_circle.png')),
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
                                      style:
                                      TextStyle(color: Colors.white, fontSize: 25),
                                    ),
                                    DefaultFormField(
                                        hintText: '',
                                        prefixIcon: const Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.white),
                                        controller: _updateUserLocationCubit.userLocationController,
                                        keyboardType: TextInputType.text),
                                    const SizedBox(height: 15),
                                    DefaultMaterialButton(
                                      text: 'تحديد العنوان',
                                      onPressed: () {
                                        if (clickedMarkerLat != null &&
                                            clickedMarkerLng != null) {
                                          _updateUserLocationCubit.updateUserLocation(
                                              lat: clickedMarkerLat!,
                                              lon: clickedMarkerLng!,
                                              address: _updateUserLocationCubit
                                                  .userLocationController.text);

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
          )),
    );
  }
}
