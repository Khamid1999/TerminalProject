class Settings {
  List<SettingsModel>? settings;

  Settings({
    this.settings,
  });

  Settings.fromJson(Map<String, dynamic> json) {
    if (json['settings'] != null) {
      settings = <SettingsModel>[];
      json['settings'].forEach(
        (v) {
          settings!.add(
            new SettingsModel.fromJson(v),
          );
        },
      );
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.settings != null) {
      data['settings'] = this.settings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SettingsModel {
  int? id;
  String? userId;
  String? language;
  String? mainCurrency;
  String? dateTime;

  SettingsModel({
    this.id,
    this.userId,
    this.language,
    this.mainCurrency,
    this.dateTime,
  });

  SettingsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    language = json['language'];
    mainCurrency = json['main_currency'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['language'] = this.language;
    data['main_currency'] = this.mainCurrency;
    data['date_time'] = this.dateTime;
    return data;
  }
}
