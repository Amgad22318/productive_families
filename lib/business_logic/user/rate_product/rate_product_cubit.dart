import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/data/models/user_models/rates/user_rate_product_model.dart';
import 'package:productive_families/data/requests/user/rates/user_rate_product_request.dart';

import '../../../constants/constant_methods.dart';

part 'rate_product_state.dart';

class UserRateProductCubit extends Cubit<UserRateProductState> {
  UserRateProductCubit() : super(RateProductInitial());

  static UserRateProductCubit get(context) =>
      BlocProvider.of<UserRateProductCubit>(context);

  UserRateProductModel userRateProductModel = UserRateProductModel();

  void rateProduct({
    required String? comment,
    required int productId,
    required int rate,
    required XFile? image,
  }) {
    emit(UserRateProductLoadingState());
    UserRateProductRequest()
        .userRateProductRequest(
            comment: comment, productId: productId, rate: rate, image: image)
        .then((value) {
      userRateProductModel = value;
      if (value.status == 200) {
        emit(UserRateProductSuccessState(msg: userRateProductModel.message));
      } else {
        emit(UserRateProductErrorState(msg: userRateProductModel.message));
      }
    }).catchError((error) {
      printResponse('rateProduct ' + error.toString());
    });
  }
}
