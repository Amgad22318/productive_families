import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/constants/constant_methods.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalStates> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);
  Position? currentPosition;

  void getCurrentLocation() {
    emit(GetCurrentLocationLoadingState());
    determinePosition().then((value) async {
      currentPosition = value;
      emit(GetCurrentLocationSuccessState());
    }).catchError((error) {
      printError(error.toString());
      emit(GetCurrentLocationErrorState());
    });
  }
  String? convertedAddress;

  void convertPositionToAddress({
    required double lat,
    required double lon,
  }) async {
    List<Placemark> placeMarks = await placemarkFromCoordinates(lat, lon);
    Placemark place = placeMarks[0];
    convertedAddress='${place.street} ${place.locality}';
    emit(ConvertPositionToAddressState());
  }
}
