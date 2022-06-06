part of 'user_sub_category_product_cubit.dart';

@immutable
abstract class UserSubCategoryProductStates {}

class UserSubCategoryProductInitial extends UserSubCategoryProductStates {}

class UserGetSubCategoryProductLoadingState
    extends UserSubCategoryProductStates {}

class UserGetSubCategoryProductSuccessState
    extends UserSubCategoryProductStates {}

class UserGetSubCategoryProductErrorState extends UserSubCategoryProductStates {
}

class UserGetSubCategoryProductEmptyState extends UserSubCategoryProductStates {
}
