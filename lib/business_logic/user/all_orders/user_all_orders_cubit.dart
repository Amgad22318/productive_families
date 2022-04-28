import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/data/models/user_models/orders/user_all_orders_model.dart';
import 'package:productive_families/data/models/user_models/orders/user_cancel_order_model.dart';
import 'package:productive_families/data/requests/user/orders/user_all_orders_request.dart';
import 'package:productive_families/data/requests/user/orders/user_cancel_order_process_request.dart';

import '../../../constants/constant_methods.dart';

part 'user_all_orders_state.dart';

class UserAllOrdersCubit extends Cubit<UserAllOrdersState> {
  UserAllOrdersCubit() : super(UserAllOrdersInitial());

  static UserAllOrdersCubit get(context) => BlocProvider.of(context);
  late UserAllOrdersModel userAllOrdersModel;

  void getAllOrders() async {
    emit(UserGetAllOrdersLoadingState());
    UserAllOrdersRequest().userAllOrdersRequest(page: 1).then((value) {
      if (value.status == 200) {
        userAllOrdersModel = value;
        emit(UserGetAllOrdersSuccessState());
      } else if (value.status == 204) {
        emit(UserGetAllOrdersEmptyState());
      }
    }).catchError((error) {
      emit(UserGetAllOrdersErrorState());
      printError('getAllOrders ' + error.toString());
    });
  }

  void getAllOrdersLoadMore() async {
    emit(UserGetAllOrdersLoadingState());
    UserAllOrdersRequest().userAllOrdersRequest(page: 1).then((value) {
      if (value.status == 200) {
        userAllOrdersModel = value;
        emit(UserGetAllOrdersSuccessState());
      } else if (value.status == 204) {
        emit(UserGetAllOrdersEmptyState());
      }
    }).catchError((error) {
      emit(UserGetAllOrdersErrorState());
      printError('getAllOrders ' + error.toString());
    });
  }

late UserCancelOrderModel userCancelOrderModel;
  void cancelOrder({
    required int orderId,
    required int itemIndex,
  }) async {
    emit(UserCancelOrderLoadingState());
    UserCancelOrderProcessRequest()
        .userCancelOrderProcessRequest(orderId: orderId)
        .then((value) {
      if (value.status == 200) {
        userCancelOrderModel = value;
        emit(UserCancelOrderSuccessState(itemIndex: itemIndex));
      }
    }).catchError((error) {
      emit(UserCancelOrderErrorState());
      printError('cancelOrder ' + error.toString());
    });
  }
}
