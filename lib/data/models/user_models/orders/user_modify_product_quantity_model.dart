import 'dart:convert';
UserModifyProductQuantityModel userModifyProductQuantityModelFromJson(String str) => UserModifyProductQuantityModel.fromJson(json.decode(str));
String userModifyProductQuantityModelToJson(UserModifyProductQuantityModel data) => json.encode(data.toJson());
class UserModifyProductQuantityModel {
  // UserModifyProductQuantityModel({
  //     this.status,
  //     this.message,
  //     this.quantity,});

  UserModifyProductQuantityModel.fromJson(dynamic json) {
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