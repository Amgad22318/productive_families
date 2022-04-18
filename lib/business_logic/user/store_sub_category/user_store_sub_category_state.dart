part of 'user_store_sub_category_cubit.dart';

@immutable
abstract class UserStoreSubCategoryStates {}

class StoreSubCategoryInitial extends UserStoreSubCategoryStates {}

class UserGetStoreSubCategoryLoadingState
    extends UserStoreSubCategoryStates {}

class UserGetStoreSubCategorySuccessState
    extends UserStoreSubCategoryStates {}

class UserGetStoreSubCategoryErrorState
    extends UserStoreSubCategoryStates {}
