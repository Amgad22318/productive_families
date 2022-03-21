class UserUpdateAddressModel {
  UserUpdateAddressModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }
  int? status;
  String? message;



}