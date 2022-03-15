class AboutUsModel {

  AboutUsModel.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    appSettings = json['app_settings'] != null ? AppSettings.fromJson(json['app_settings']) : null;
  }
  int? status;
  AppSettings? appSettings;
  late String message;


}
class AppSettings {
  AppSettings.fromJson(dynamic json) {
    aboutUs = json['about_us'];
  }
  String? aboutUs;

}