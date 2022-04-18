part of 'user_all_and_single_category_stores_cubit.dart';

@immutable
abstract class UserAllAndSingleCategoryStoresStates {}

class AllAndSingleCategoryStoresInitial
    extends UserAllAndSingleCategoryStoresStates {}

class UserGetStoresLoadingState
    extends UserAllAndSingleCategoryStoresStates {}

class UserGetAllCategoriesStoresSuccessState
    extends UserAllAndSingleCategoryStoresStates {}
class UserGetSingleCategoriesStoresSuccessState
    extends UserAllAndSingleCategoryStoresStates {}

class UserGetAllCategoriesStoresErrorState
    extends UserAllAndSingleCategoryStoresStates {}
class UserGetSingleCategoriesStoresErrorState
    extends UserAllAndSingleCategoryStoresStates {}
class UserChangeSelectedCategoryIndexState
    extends UserAllAndSingleCategoryStoresStates {
  final int selectedCategoryIndex;

  UserChangeSelectedCategoryIndexState(this.selectedCategoryIndex);

}
