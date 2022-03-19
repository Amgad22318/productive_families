

import 'package:productive_families/data/models/user_models/auth/user_register_model.dart';

class UserRegisterConfirmPhoneModel {


  UserRegisterConfirmPhoneModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    account = json['account'] != null ? Account.fromJson(json['account']) : null;
  }
  int? status;
  String? message;
  Account? account;

}
