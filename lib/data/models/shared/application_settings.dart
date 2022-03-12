
class ApplicationSetting {


  ApplicationSetting.fromJson(dynamic json) {
    status = json['status'];
    appSettings = json['app_settings'] != null ? AppSettings.fromJson(json['appSettings']) : null;
  }
  int? status;
  AppSettings? appSettings;



}


class AppSettings {
  AppSettings.fromJson(dynamic json) {
    name = json['name'];
    description = json['description'];
    logo = json['logo'];
    pricePerKm = json['price_per_km'];
    deliveryRange = json['delivery_range'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    snapchat = json['snapchat'];
    emails = json['emails'];
    phones = json['phones'];
    vat = json['vat'];
  }
  String? name;
  String? description;
  String? logo;
  int? pricePerKm;
  int? deliveryRange;
  dynamic facebook;
  dynamic twitter;
  dynamic snapchat;
  String? emails;
  String? phones;
  int? vat;

}