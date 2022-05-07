part of 'user_start_order_process_and__order_location_cubit.dart';

@immutable
abstract class UserStartOrderProcessAndOrderLocationState {}

class UserStartOrderProcessAndOrderLocationInitial
    extends UserStartOrderProcessAndOrderLocationState {}

class UserStartOrderProcessLoadingState
    extends UserStartOrderProcessAndOrderLocationState {}

class UserStartOrderProcessSuccessState
    extends UserStartOrderProcessAndOrderLocationState {
  final String message;

  UserStartOrderProcessSuccessState(this.message);
}

class UserStartOrderProcessErrorState
    extends UserStartOrderProcessAndOrderLocationState {}

class UserPromoCodeSuccessState
    extends UserStartOrderProcessAndOrderLocationState {
  final String message;

  UserPromoCodeSuccessState(this.message);
}
class UserWrongPromoCodeState
    extends UserStartOrderProcessAndOrderLocationState {
  final String message;

  UserWrongPromoCodeState(this.message);
}

class UserPromoCodeErrorState
    extends UserStartOrderProcessAndOrderLocationState {}

class ConvertPositionToAddressState extends UserStartOrderProcessAndOrderLocationState {}
