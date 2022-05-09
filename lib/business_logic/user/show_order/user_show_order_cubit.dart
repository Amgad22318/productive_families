import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/data/models/user_models/orders/user_show_order_model.dart';
import 'package:productive_families/data/requests/user/orders/user_show_order_request.dart';

import '../../../constants/constant_methods.dart';

part 'user_show_order_state.dart';

class UserShowOrderCubit extends Cubit<UserShowOrderState> {
  UserShowOrderCubit() : super(UserShowOrderInitial());
  static UserShowOrderCubit get(context) => BlocProvider.of(context);

  late UserShowOrderModel userShowOrderModel;

  void showOrder({required int orderId}) async {
    emit(UserShowOrderLoadingState());
    UserShowOrderRequest()
        .userShowOrderRequest(page: 1, orderId: orderId)
        .then((value) {
      if (value.status == 200) {
        userShowOrderModel = value;
        emit(UserShowOrderSuccessState());
      }
    }).catchError((error) {
      emit(UserShowOrderErrorState());
      printError('showOrder ' + error.toString());
    });
  }

  void showOrderLoadMore({required int orderId}) async {
    emit(UserShowOrderLoadingState());
    UserShowOrderRequest()
        .userShowOrderRequest(page: 1, orderId: orderId)
        .then((value) {
      if (value.status == 200) {
        userShowOrderModel = value;
        emit(UserShowOrderSuccessState());
      }
    }).catchError((error) {
      emit(UserShowOrderErrorState());
      printError('showOrder ' + error.toString());
    });
  }
}
