import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_local_state.dart';

class UserLocalCubit extends Cubit<UserLocalState> {
  UserLocalCubit() : super(UserLocalInitial());
}
