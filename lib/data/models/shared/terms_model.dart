class TermsModel {
  TermsModel.fromJson(dynamic json) {
    status = json['status'];
    appSettings = json['app_settings'] != null
        ? AppSettings.fromJson(json['app_settings'])
        : null;
  }

  int? status;
  AppSettings? appSettings;
}
class AppSettings {
  AppSettings.fromJson(dynamic json) {
    terms = json['terms'];
  }

  String? terms;
}
