part of 'product_details_cubit.dart';

@immutable
abstract class UserProductDetailsStates {}

class ProductDetailsInitial extends UserProductDetailsStates {}

class UserGetProductDetailsLoadingState extends UserProductDetailsStates {}

class UserGetProductDetailsSuccessState extends UserProductDetailsStates {}

class UserGetProductDetailsErrorState extends UserProductDetailsStates {}

