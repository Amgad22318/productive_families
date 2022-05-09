import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/data/requests/user/orders/user_order_show_checkout_products_request.dart';

import '../../../constants/constant_methods.dart';
import '../../../data/models/user_models/orders/user_order_show_check_out_products_model.dart';

part 'user_order_checkout_product_state.dart';

class UserOrderCheckoutProductCubit extends Cubit<UserOrderCheckoutProductState> {
  UserOrderCheckoutProductCubit() : super(UserOrderCheckoutProductInitial());
  static UserOrderCheckoutProductCubit get(context) => BlocProvider.of(context);

  UserOrderShowCheckOutProductsModel userOrderShowCheckOutProductsModel=UserOrderShowCheckOutProductsModel();

  void  getCheckOutProducts({required int orderId}) async {
    emit(UserGetOrderProductCheckoutLoadingState());
    UserOrderShowCheckoutProductsRequest().userOrderShowCheckoutProductsRequest(page: 1, orderId: orderId)
        .then((value) {
      if (value.status == 200) {
        userOrderShowCheckOutProductsModel = value;
        emit(UserGetOrderProductCheckoutSuccessState());
      }
    }).catchError((error) {
      emit(UserGetOrderProductCheckoutErrorState());
      printError('getCheckOutProducts ' + error.toString());
    });
  }
}
