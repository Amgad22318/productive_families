part of 'all_and_single_category_stores_cubit.dart';

@immutable
abstract class AllAndSingleCategoryStoresStates {}

class AllAndSingleCategoryStoresInitial
    extends AllAndSingleCategoryStoresStates {}

class UserGetStoresLoadingState
    extends AllAndSingleCategoryStoresStates {}

class UserGetAllCategoriesStoresSuccessState
    extends AllAndSingleCategoryStoresStates {}
class UserGetSingleCategoriesStoresSuccessState
    extends AllAndSingleCategoryStoresStates {}

class UserGetAllCategoriesStoresErrorState
    extends AllAndSingleCategoryStoresStates {}
class UserGetSingleCategoriesStoresErrorState
    extends AllAndSingleCategoryStoresStates {}
class UserChangeSelectedCategoryIndexState
    extends AllAndSingleCategoryStoresStates {
  final int selectedCategoryIndex;

  UserChangeSelectedCategoryIndexState(this.selectedCategoryIndex);

}
