import 'dart:convert';
UserAddProductToCartModel userAddProductToCartModelFromJson(String str) => UserAddProductToCartModel.fromJson(json.decode(str));
String userAddProductToCartModelToJson(UserAddProductToCartModel data) => json.encode(data.toJson());
class UserAddProductToCartModel {
  // UserAddProductToCartModel({
  //     this.status,
  //     this.message,
  //     this.orderId,});

  UserAddProductToCartModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    orderId = json['order_id'];
  }
  late int status;
  late String message;
  int? orderId;
// UserAddProductToCartModel copyWith({  int? status,
//   String? message,
//   int? orderId,
// }) => UserAddProductToCartModel(  status: status ?? this.status,
//   message: message ?? this.message,
//   orderId: orderId ?? this.orderId,
// );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['order_id'] = orderId;
    return map;
  }

}