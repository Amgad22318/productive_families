import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/data/models/user_models/orders/user_add_product_to_cart_model.dart';
import 'package:productive_families/data/requests/user/orders/user_add_product_to_cart_request.dart';

import '../../../constants/constant_methods.dart';

part 'user_add_product_to_cart_state.dart';

class UserAddProductToCartCubit extends Cubit<UserAddProductToCartStates> {
  UserAddProductToCartCubit() : super(UserAddProductToCartInitial());
  static UserAddProductToCartCubit get(context) => BlocProvider.of(context);

  UserAddProductToCartModel? userAddProductToCartModel;

  void userAddProductToCart({required int productId}) async {
    emit(UserAddProductToCartLoadingState());
    UserAddProductToCartRequest().userAddProductToCartRequest(productId: productId)
        .then((value) {
      if (value.status == 200) {
        userAddProductToCartModel = value;
        emit(UserAddProductToCartSuccessState(userAddProductToCartModel!.message));
      }
      else  if (value.status == 420) {
        userAddProductToCartModel = value;
        emit(UserAddProductToCartWrongProviderState(userAddProductToCartModel!.message));
      }

    }).catchError((error) {
      emit(UserAddProductToCartErrorState());
      printError('userAddProductToCart ' + error.toString());
    });
  }

}
