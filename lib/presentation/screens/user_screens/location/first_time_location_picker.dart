import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:productive_families/business_logic/global_cubit/global_cubit.dart';
import 'package:productive_families/business_logic/user/local/user_local_cubit.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/constants/enums.dart';
import 'package:productive_families/data/data_provider/local/cache_helper.dart';
import 'package:productive_families/presentation/screens/user_screens/chat/customer_services_chat_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/shop_layout/user_shop_layout.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_map.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import '../../../../constants/shared_preferences_keys.dart';

class FirstTimeLocationPicker extends StatefulWidget {
  const FirstTimeLocationPicker({Key? key}) : super(key: key);

  @override
  State<FirstTimeLocationPicker> createState() =>
      _FirstTimeLocationPickerState();
}

class _FirstTimeLocationPickerState extends State<FirstTimeLocationPicker> {
  final TextEditingController locationController = TextEditingController();

  final Completer<GoogleMapController> _controller = Completer();
  late double clickedMarkerLat;
  late double clickedMarkerLng;
  late GlobalCubit globalCubit;

  @override
  void initState() {
    globalCubit = GlobalCubit.get(context);
    globalCubit.getCurrentLocation();
    clickedMarkerLat = 0;
    clickedMarkerLng = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserLocalCubit(),
      child: Scaffold(
        appBar: DefaultShopAppbar(
          height: 80,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: DefaultMaterialButton(
                  height: 50,
                  background: backGroundWhite,
                  onPressed: () {
                    navigateToAndFinish(
                        context,
                        const UserShopLayout(
                          index: 1,
                        ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/shop.svg",
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'المتاجر',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: DefaultMaterialButton(
                  height: 50,
                  background: backGroundWhite,
                  onPressed: () {
                    navigateToAndFinish(context, CustomerServicesChatScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/patch-question-fll.svg",
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'استفسارات',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: BlocBuilder<GlobalCubit, GlobalStates>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(child: Builder(
                        builder: (context) {
                          return globalCubit.currentPosition != null
                              ? DefaultMap(
                                  onTap: (argument) {
                                    clickedMarkerLat = argument.latitude;
                                    clickedMarkerLng = argument.longitude;
                                    globalCubit.getAddress(
                                        lat: clickedMarkerLat,
                                        lon: clickedMarkerLng);
                                  },
                                  myLocationEnabled: true,
                                  myLocationButtonEnabled: true,

                                  mapType: MapType.normal,
                                  initialCameraPosition: CameraPosition(
                                    target: LatLng(
                                        globalCubit.currentPosition!.latitude,
                                        globalCubit.currentPosition!.longitude),
                                    zoom: 14.4746,
                                  ),
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
                              : const Center(
                                  child: CircularProgressIndicator());
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
                Flexible(
                  flex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.maxFinite,
                        color: darkBlue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DefaultText(
                                    text: 'أدخل موقعك الحالى',
                                    textStyle:
                                        Theme.of(context).textTheme.subtitle1,
                                    color: Colors.white,
                                  ),
                                  Builder(builder: (context) {
                                    locationController.text =
                                        globalCubit.convertedAddress ?? '';
                                    return DefaultFormField(
                                        labelColor: Colors.white,
                                        hintText: '',
                                        prefixIcon: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/location.svg',
                                              height: 24.0,
                                              width: 24.0,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                        controller: locationController,
                                        validator: (_) {
                                          return null;
                                        },
                                        keyboardType: TextInputType.text);
                                  }),
                                  const SizedBox(height: 15),
                                  BlocListener<UserLocalCubit, UserLocalStates>(
                                    listener: (context, state) {
                                      if (state
                                          is UserUpdateAddressFirstTimeSuccessState) {
                                        showToastMsg(
                                            msg: state.message,
                                            toastState: ToastStates.SUCCESS);
                                        locationController.text = '';
                                        CacheHelper.saveDataToSP(key: SharedPreferencesKeys.SP_FIRST_TIME_LOCATION_PICKED, value: true);
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            SHOP_LAYOUT,
                                            (route) => false,arguments: 0);
                                      } else if (state
                                          is UserUpdateAddressFirstTimeErrorState) {
                                        showToastMsg(
                                            msg: state.message,
                                            toastState: ToastStates.ERROR);
                                      }
                                    },
                                    child: DefaultMaterialButton(
                                      text: 'تأكيد العنوان',
                                      onPressed: () {
                                        if (clickedMarkerLat != 0 &&
                                            clickedMarkerLng != 0) {
                                          UserLocalCubit.get(context)
                                              .updateUserLocation(
                                                  lat: clickedMarkerLat,
                                                  lon: clickedMarkerLng,
                                                  address:
                                                      locationController.text);
                                        } else {
                                          showToastMsg(
                                              msg: 'اختر العنوان',
                                              toastState: ToastStates.WARNING);
                                        }
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
