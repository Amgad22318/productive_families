// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String AppLang = 'ar';
String AppCurrencyShortcut = 'ر.س';
String AppCurrencyFull = 'ريال سعودي';
int SelectedCategoryFromHome = 0;
CameraPosition AppInitialCameraPosition = const CameraPosition(
  target: LatLng(23.8859, 45.0792),
  zoom: 4.5,
);

///////////////////////////////// sharedPreferences constant /////////////////////////////////////////////

String? accessToken;

Position? userPosition;
String? accountType;
