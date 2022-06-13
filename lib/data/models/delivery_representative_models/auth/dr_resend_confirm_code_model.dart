import 'dart:convert';
DrResendConfirmCodeModel drResendConfirmCodeModelFromJson(String str) => DrResendConfirmCodeModel.fromJson(json.decode(str));
String drResendConfirmCodeModelToJson(DrResendConfirmCodeModel data) => json.encode(data.toJson());
class DrResendConfirmCodeModel {
  DrResendConfirmCodeModel({
      int? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  DrResendConfirmCodeModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  int? _status;
  String? _message;

  int get status => _status ?? 0;
  String get message => _message ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}