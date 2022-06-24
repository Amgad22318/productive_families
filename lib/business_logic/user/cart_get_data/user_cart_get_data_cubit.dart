import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../constants/constant_methods.dart';
import '../../../data/models/user_models/orders/user_show_cart_products_model.dart';
import '../../../data/requests/user/orders/user_show_cart_products_request.dart';

part 'user_cart_get_data_state.dart';

class UserCartGetDataCubit extends Cubit<UserCartGetDataState> {
  UserCartGetDataCubit() : super(UserCartGetDataInitial());
  static UserCartGetDataCubit get(context) => BlocProvider.of(context);

  UserShowCartProductsModel? userShowCartProductsModel;

  void removeItem(int index) {
    userShowCartProductsModel!.products.removeAt(index);
    if (userShowCartProductsModel!.products.isEmpty) {
      emit(UserGetCartProductEmptyState());
    } else {
      emit(UserCartItemRemovedState());
    }
  }

  void getCartProducts() async {
    emit(UserGetCartProductLoadingState());
    UserShowCartProductsRequest()
        .userShowCartProductsRequest(page: 1)
        .then((value) {
      if (value.status == 200) {
        userShowCartProductsModel = value;
        emit(UserGetCartProductSuccessState());
      } else if (value.status == 204) {
        emit(UserGetCartProductEmptyState());
      }
    }).catchError((error) {
      emit(UserGetCartProductErrorState());
      printError('getCartProducts ' + error.toString());
    });
  }

  void getCartProductsLoadMore() async {
    emit(UserGetCartProductLoadingState());
    UserShowCartProductsRequest()
        .userShowCartProductsRequest(page: 1)
        .then((value) {
      if (value.status == 200) {
        userShowCartProductsModel = value;
        emit(UserGetCartProductSuccessState());
      }
    }).catchError((error) {
      emit(UserGetCartProductErrorState());
      printError('getCartProducts ' + error.toString());
    });
  }
}
