import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DefaultMap extends StatelessWidget {
  final CameraPosition initialCameraPosition;
  final void Function(LatLng)? onTap;
  final Set<Marker> markers;
  final void Function(GoogleMapController)? onMapCreated;
  final bool myLocationEnabled;
  final bool myLocationButtonEnabled;
  final bool zoomControlsEnabled;
  final bool zoomGesturesEnabled;
  final MapType mapType;

  const DefaultMap({
    Key? key,
    required this.initialCameraPosition,
    this.onTap,
    this.markers = const {},
    this.onMapCreated,
    this.myLocationEnabled = true,
    this.myLocationButtonEnabled = true,
    this.mapType = MapType.normal,
    this.zoomControlsEnabled = true,
    this.zoomGesturesEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      zoomGesturesEnabled: zoomGesturesEnabled,
      zoomControlsEnabled: zoomControlsEnabled,
      initialCameraPosition: initialCameraPosition,
      onTap: onTap,
      markers: markers,
      onMapCreated: onMapCreated,
      myLocationEnabled: myLocationEnabled,
      myLocationButtonEnabled: myLocationButtonEnabled,
      mapType: mapType,
    );
  }
}
