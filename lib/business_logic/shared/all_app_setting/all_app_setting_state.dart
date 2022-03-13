part of 'all_app_setting_cubit.dart';

@immutable
abstract class AllAppSettingStates {}

class AllAppSettingInitial extends AllAppSettingStates {}

class GetTermsLoadingState extends AllAppSettingStates{}
class GetTermsSuccessState extends AllAppSettingStates{}
class GetTermsErrorState extends AllAppSettingStates{}


class GetAboutUsLoadingState extends AllAppSettingStates{}
class GetAboutUsSuccessState extends AllAppSettingStates{}
class GetAboutUsErrorState extends AllAppSettingStates{}
