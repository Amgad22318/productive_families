
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:productive_families/constants/constants.dart';
import 'package:productive_families/data/data_provider/local/cache_helper.dart';
import 'package:productive_families/presentation/styles/colors.dart';

import 'enums.dart';

Color getColor(Set<MaterialState> states,Color color) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
  };
  if (states.any(interactiveStates.contains)) {
    return defaultYellow;
  }
  return color;
}





void printResponse(String text) {
  if (kDebugMode) {
    print('\x1B[33m$text\x1B[0m');
  }
}
void printError(String text) {
  if (kDebugMode) {
    print('\x1B[31m$text\x1B[0m');
  }
}
void printTest(String text) {
  if (kDebugMode) {
    print('\x1B[32m$text\x1B[0m');
  }
}

void navigateTo(BuildContext context, Widget widget) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
}

void navigateToAndFinish(BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (Route<dynamic> route) {
      return false;
    },
  );
}
void navigatePushReplacement(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}



void showToastMsg({required String msg, required ToastStates toastState}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state: toastState),
      textColor: Colors.black,
      fontSize: 16.0);
}



Color chooseToastColor({required ToastStates state}) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
  }
  return color;
}
Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    printError('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      printError('Location permissions are denied');

      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    printError('Location permissions are permanently denied, we cannot request permissions.');
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
Position position =await Geolocator.getCurrentPosition(desiredAccuracy:  LocationAccuracy.best);
// printTest(position.longitude.toString());
// printTest(position.latitude.toString());
// printTest(position .toString());

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return position ;
}


Future<String> convertPositionToAddress({
  required double lat,
  required double lon,
}) async {
  List<Placemark> placeMarks = await placemarkFromCoordinates(lat, lon);
  Placemark place = placeMarks[0];
 return '${place.street} ${place.locality}';
}
