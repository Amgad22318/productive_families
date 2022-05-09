import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/data/models/user_models/orders/user_order_tracks_model.dart';
import 'package:productive_families/data/requests/user/orders/user_order_tracks_request.dart';

import '../../../constants/constant_methods.dart';

part 'user_order_tracks_state.dart';

class UserOrderTracksCubit extends Cubit<UserOrderTracksState> {
  UserOrderTracksCubit() : super(UserOrderTracksInitial());
  static UserOrderTracksCubit get(context) => BlocProvider.of(context);

  UserOrderTracksModel userOrderTracksModel=UserOrderTracksModel();



  void getOrderTracks({
    required int orderId,
  }) async {
    emit(UserGetOrderTracksLoadingState());
    UserOrderTracksRequest().userOrderTracksRequest(orderId: orderId)
        .then((value) {

      if (value.status == 200) {
        userOrderTracksModel = value;
        emit(UserGetOrderTracksSuccessState());
      }
      else{
        userOrderTracksModel = value;
        emit(UserGetOrderTracksErrorState());
      }
    }).catchError((error) {
      printError('getOrderTracks '+error.toString());
    });
  }

}
