class AboutUsModel {

  AboutUsModel.fromJson(dynamic json) {
    status = json['status'];
    appSettings = json['app_settings'] != null ? AppSettings.fromJson(json['app_settings']) : null;
  }
  int? status;
  AppSettings? appSettings;

}
class AppSettings {
  AppSettings.fromJson(dynamic json) {
    aboutUs = json['about_us'];
  }
  String? aboutUs;

}