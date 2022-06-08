import 'dart:convert';

UserAddAndRemoveProductToFavoritesModel
    userAddAndRemoveProductToFavoritesModelFromJson(String str) =>
        UserAddAndRemoveProductToFavoritesModel.fromJson(json.decode(str));

String userAddAndRemoveProductToFavoritesModelToJson(
        UserAddAndRemoveProductToFavoritesModel data) =>
    json.encode(data.toJson());

class UserAddAndRemoveProductToFavoritesModel {
  UserAddAndRemoveProductToFavoritesModel(
      {int? status, String? message, int? favoriteGroupCount}) {
    _status = status;
    _message = message;
    _favoriteGroupCount = favoriteGroupCount;
  }

  UserAddAndRemoveProductToFavoritesModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _favoriteGroupCount = json['favorite_groups_count'];
  }

  int? _status;
  String? _message;
  int? _favoriteGroupCount;

  int get status => _status ?? 0;

  String get message => _message ?? "";

  int get favoriteGroupCount => _favoriteGroupCount ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['favorite_groups_count'] = _favoriteGroupCount;
    return map;
  }
}
