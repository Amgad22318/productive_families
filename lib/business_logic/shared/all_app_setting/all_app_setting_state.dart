part of 'all_app_setting_cubit.dart';

@immutable
abstract class AllAppSettingStates {}

class AllAppSettingInitial extends AllAppSettingStates {}

class GetAppTermsLoadingState extends AllAppSettingStates{}
class GetAppTermsSuccessState extends AllAppSettingStates{}
class GetAppTermsErrorState extends AllAppSettingStates{}
