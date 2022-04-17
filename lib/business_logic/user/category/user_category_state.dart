
import 'package:flutter/material.dart';

@immutable
abstract class UserCategoryStates {}

class UserCategoryInitial extends UserCategoryStates {}

class UserGetAllCategoriesLoadingState extends UserCategoryStates {}

class UserGetAllCategoriesSuccessState extends UserCategoryStates {}

class UserGetAllCategoriesErrorState extends UserCategoryStates {

}