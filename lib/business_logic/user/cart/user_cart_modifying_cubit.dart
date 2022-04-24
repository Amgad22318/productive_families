import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/data/requests/user/orders/user_delete_product_from_cart_request.dart';
import 'package:productive_families/data/requests/user/orders/user_modify_product_quantity_request.dart';

import '../../../constants/constant_methods.dart';
import '../../../data/models/user_models/orders/user_delete_product_from_cart_model.dart';
import '../../../data/models/user_models/orders/user_modify_cart_product_quantity_model.dart';

part 'user_cart_modifying_state.dart';

class UserCartModifyingCubit
    extends Cubit<UserCartModifyingStates> {
  UserCartModifyingCubit() : super(UserCartDataAndModifyingInitial());

  static UserCartModifyingCubit get(context) => BlocProvider.of(context);



  UserModifyCartProductQuantityModel? userModifyCartProductQuantityModel;

  void modifyCartProductQuantity({
    required int cartId,
    required int quantity,
  }) async {
    UserModifyProductQuantityCartRequest()
        .userModifyProductQuantityCartRequest(
            cartId: cartId, quantity: quantity)
        .then((value) {
      if (value.status == 200) {
        userModifyCartProductQuantityModel = value;

        emit(UserModifyCartProductQuantitySuccessState(
            quantity: userModifyCartProductQuantityModel!.quantity!,cartId:cartId ));
      }
    }).catchError((error) {
      emit(UserModifyCartProductQuantityErrorState());
      printError('modifyCartProductQuantity ' + error.toString());
    });
  }

  UserDeleteProductFromCartModel? userDeleteProductFromCartModel;

  void userDeleteProductFromCart({
    required int cartId,
    required int index,
  }) async {
    emit(UserDeleteFromProductCartLoadingState());
    UserDeleteProductFromCartRequest()
        .userDeleteProductFromCartRequest(cartId: cartId)
        .then((value) {
      if (value.status == 200) {
        userDeleteProductFromCartModel = value;
        emit(UserDeleteFromProductCartSuccessState(index));
      }
    }).catchError((error) {
      emit(UserDeleteFromProductCartErrorState());
      printError('userDeleteProductFromCart ' + error.toString());
    });
  }
}
