class UserUpdateAddressModel {

  UserUpdateAddressModel({
    int? status,
    String? message,}){
    _status = status;
    _message = message;
  }



  UserUpdateAddressModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  int? _status;
  String? _message;

  int get status => _status??0;
  String get message => _message??"";

}