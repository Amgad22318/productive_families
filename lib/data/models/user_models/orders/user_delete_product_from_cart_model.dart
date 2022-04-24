import 'dart:convert';
UserDeleteProductFromCartModel userDeleteProductFromCartModelFromJson(String str) => UserDeleteProductFromCartModel.fromJson(json.decode(str));
String userDeleteProductFromCartModelToJson(UserDeleteProductFromCartModel data) => json.encode(data.toJson());
class UserDeleteProductFromCartModel {
  // UserDeleteProductFromCartModel({
  //     this.status,
  //     this.message,});

  UserDeleteProductFromCartModel.fromJson(dynamic json) {
    status = json['status']??0;
    message = json['message']??'';
  }
  late int status;
  late String message;
// UserDeleteProductFromCartModel copyWith({  int? status,
//   String? message,
// }) => UserDeleteProductFromCartModel(  status: status ?? this.status,
//   message: message ?? this.message,
// );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}