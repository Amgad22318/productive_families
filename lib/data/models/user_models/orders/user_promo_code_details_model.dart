import 'dart:convert';
UserPromoCodeDetailsModel userPromoCodeDetailsModelFromJson(String str) => UserPromoCodeDetailsModel.fromJson(json.decode(str));
String userPromoCodeDetailsModelToJson(UserPromoCodeDetailsModel data) => json.encode(data.toJson());
class UserPromoCodeDetailsModel {
  UserPromoCodeDetailsModel({
      int? status, 
      String? message, 
      Voucher? voucher,}){
    _status = status;
    _message = message;
    _voucher = voucher;
}

  UserPromoCodeDetailsModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _voucher = json['voucher'] != null ? Voucher.fromJson(json['voucher']) : null;
  }
  int? _status;
  String? _message;
  Voucher? _voucher;

  int get status => _status??0;
  String get message => _message??"";
  Voucher get voucher => _voucher??Voucher();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_voucher != null) {
      map['voucher'] = _voucher?.toJson();
    }
    return map;
  }

}

Voucher voucherFromJson(String str) => Voucher.fromJson(json.decode(str));
String voucherToJson(Voucher data) => json.encode(data.toJson());
class Voucher {
  Voucher({
      int? id, 
      String? code,
    num? discount,
      String? startAt, 
      String? endAt, 
      int? maxUsage, 
      int? isActive,}){
    _id = id;
    _code = code;
    _discount = discount;
    _startAt = startAt;
    _endAt = endAt;
    _maxUsage = maxUsage;
    _isActive = isActive;
}

  Voucher.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _discount = json['discount'];
    _startAt = json['start_at'];
    _endAt = json['end_at'];
    _maxUsage = json['max_usage'];
    _isActive = json['is_active'];
  }
  int? _id;
  String? _code;
  num? _discount;
  String? _startAt;
  String? _endAt;
  int? _maxUsage;
  int? _isActive;

  int? get id => _id;
  String get code => _code??"";
  num get discount => _discount??0;
  String get startAt => _startAt??"";
  String get endAt => _endAt??"";
  int get maxUsage => _maxUsage??0;
  int get isActive => _isActive??0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['discount'] = _discount;
    map['start_at'] = _startAt;
    map['end_at'] = _endAt;
    map['max_usage'] = _maxUsage;
    map['is_active'] = _isActive;
    return map;
  }

}