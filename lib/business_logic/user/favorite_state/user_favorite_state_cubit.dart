import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../constants/constant_methods.dart';
import '../../../data/models/user_models/favorites/user_add_and_remove_product_to_favorites_model.dart';
import '../../../data/requests/user/favorites/user_add_and_remove_product_to_favorites_request.dart';

part 'user_favorite_state_state.dart';

class UserFavoriteStateCubit extends Cubit<UserFavoriteStateStates> {
  UserFavoriteStateCubit() : super(FavoriteStateInitial());
  static UserFavoriteStateCubit get(context) => BlocProvider.of(context);


  UserAddAndRemoveProductToFavoritesModel
  userAddAndRemoveProductToFavoritesModel =
  UserAddAndRemoveProductToFavoritesModel();

  void userFavoritesGroupAddOrDeleteProduct({
    required int groupId,
    required int productId,
  }) async {
    UserAddAndRemoveProductToFavoriteRequest()
        .userAddAndRemoveProductToFavoriteRequest(
        productId: productId, groupId: groupId)
        .then((value) async {
      if (value.status == 200) {
        userAddAndRemoveProductToFavoritesModel = value;
        emit(UserFavoriteGroupProductAddOrDeleteSuccessState(
            userAddAndRemoveProductToFavoritesModel.message,productId));
      } else {
        userAddAndRemoveProductToFavoritesModel = value;

        emit(UserFavoriteGroupProductAddOrDeleteFailState(
            userAddAndRemoveProductToFavoritesModel.message));
      }
    }).catchError((error) {
      emit(UserFavoriteGroupProductAddOrDeleteErrorState());
      printError('userFavoritesGroupAddOrDeleteProduct ' + error.toString());
    });
  }

}
