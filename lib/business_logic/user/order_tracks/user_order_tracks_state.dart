part of 'user_order_tracks_cubit.dart';

@immutable
abstract class UserOrderTracksState {}

class UserOrderTracksInitial extends UserOrderTracksState {}

class UserGetOrderTracksLoadingState extends UserOrderTracksState {}

class UserGetOrderTracksSuccessState extends UserOrderTracksState {}

class UserGetOrderTracksErrorState extends UserOrderTracksState {}
