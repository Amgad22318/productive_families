import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/data/models/user_models/orders/user_show_cart_products_model.dart';
import 'package:productive_families/data/requests/user/orders/user_delete_product_from_cart_request.dart';
import 'package:productive_families/data/requests/user/orders/user_modify_product_quantity_request.dart';
import 'package:productive_families/data/requests/user/orders/user_show_cart_products_request.dart';

import '../../../constants/constant_methods.dart';
import '../../../data/models/user_models/orders/user_delete_product_from_cart_model.dart';
import '../../../data/models/user_models/orders/user_modify_cart_product_quantity_model.dart';

part 'user_cart_data_and_modifying_state.dart';

class UserCartDataAndModifyingCubit
    extends Cubit<UserCartDataAndModifyingState> {
  UserCartDataAndModifyingCubit() : super(UserCartDataAndModifyingInitial());

  static UserCartDataAndModifyingCubit get(context) => BlocProvider.of(context);

  UserShowCartProductsModel? userShowCartProductsModel;

  void getCartProducts() async {
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

  UserModifyCartProductQuantityModel? userModifyCartProductQuantityModel;

  void modifyCartProductQuantity({
    required int cartId,
    required int quantity,
  }) async {
    emit(UserModifyCartProductQuantityLoadingState());
    UserModifyProductQuantityCartRequest()
        .userModifyProductQuantityCartRequest(
            cartId: cartId, quantity: quantity)
        .then((value) {
      if (value.status == 200) {
        userModifyCartProductQuantityModel = value;
        emit(UserModifyCartProductQuantitySuccessState());
      }
    }).catchError((error) {
      emit(UserModifyCartProductQuantityErrorState());
      printError('modifyCartProductQuantity ' + error.toString());
    });
  }


  UserDeleteProductFromCartModel? userDeleteProductFromCartModel;

  void userDeleteProductFromCart({
    required int cartId,
  }) async {
    emit(UserDeleteFromProductCartLoadingState());
    UserDeleteProductFromCartRequest()
        .userDeleteProductFromCartRequest(
        cartId: cartId)
        .then((value) {
      if (value.status == 200) {
        userDeleteProductFromCartModel = value;
        emit(UserDeleteFromProductCartSuccessState());
      }
    }).catchError((error) {
      emit(UserDeleteFromProductCartErrorState());
      printError('userDeleteProductFromCart ' + error.toString());
    });
  }

}
