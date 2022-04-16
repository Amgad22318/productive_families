import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/data/models/user_models/products/user_show_product_model.dart';
import 'package:productive_families/data/requests/user/products/user_show_product_request.dart';

import '../../../constants/constant_methods.dart';

part 'product_details_state.dart';

class UserProductDetailsCubit extends Cubit<UserProductDetailsStates> {
  UserProductDetailsCubit() : super(ProductDetailsInitial());

  static UserProductDetailsCubit get(context) => BlocProvider.of(context);

  UserShowProductModel? userShowProductModel;

  void getUserProductDetails({required int productId}) async {
    emit(UserGetProductDetailsLoadingState());
    UserShowProductsRequest.userShowProductsRequest(productId: productId)
        .then((value) {
      if (value.status == 200) {
        userShowProductModel = value;
        emit(UserGetProductDetailsSuccessState());
      }
    }).catchError((error) {
      emit(UserGetProductDetailsErrorState());
      printError('getUserProductDetails ' + error.toString());
    });
  }
}
