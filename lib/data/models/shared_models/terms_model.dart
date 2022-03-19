class TermsModel {
  TermsModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    appSettings = json['app_settings'] != null
        ? AppSettings.fromJson(json['app_settings'])
        : null;
  }
  late String message;
  int? status;
  AppSettings? appSettings;
}
class AppSettings {
  AppSettings.fromJson(dynamic json) {
    terms = json['terms'];
  }

  String? terms;
}
