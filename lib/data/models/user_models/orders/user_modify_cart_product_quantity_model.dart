import 'dart:convert';
UserModifyCartProductQuantityModel userModifyProductQuantityModelFromJson(String str) => UserModifyCartProductQuantityModel.fromJson(json.decode(str));
String userModifyProductQuantityModelToJson(UserModifyCartProductQuantityModel data) => json.encode(data.toJson());
class UserModifyCartProductQuantityModel {
  // UserModifyProductQuantityModel({
  //     this.status,
  //     this.message,
  //     this.quantity,});

  UserModifyCartProductQuantityModel.fromJson(dynamic json) {
    status = json['status']??0;
    message = json['message'];
    quantity = json['quantity'];
  }
  late int status;
  String? message;
  int? quantity;
// UserModifyProductQuantityModel copyWith({  int? status,
//   String? message,
//   int? quantity,
// }) => UserModifyProductQuantityModel(  status: status ?? this.status,
//   message: message ?? this.message,
//   quantity: quantity ?? this.quantity,
// );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['quantity'] = quantity;
    return map;
  }

}