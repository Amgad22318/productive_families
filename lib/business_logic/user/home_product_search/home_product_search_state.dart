part of 'home_product_search_cubit.dart';

@immutable
abstract class UserProductSearchStates {}

class HomeProductSearchInitial extends UserProductSearchStates {}
class UserProductSearchLoadingState extends UserProductSearchStates {}

class UserProductSearchSuccessState extends UserProductSearchStates {}
class UserProductSearchEmptyState extends UserProductSearchStates {}

class UserProductSearchErrorState extends UserProductSearchStates {}
