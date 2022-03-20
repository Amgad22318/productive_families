part of 'global_cubit.dart';

@immutable
abstract class GlobalStates {}

class GlobalInitial extends GlobalStates {}



class GetCurrentLocationLoadingState extends GlobalStates {}

class GetCurrentLocationSuccessState extends GlobalStates {}

class GetCurrentLocationErrorState extends GlobalStates {



}

