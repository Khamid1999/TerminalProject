class AuthModel {
  AuthModel({
    this.login,
  });

  AuthModel.fromJson(dynamic json) {
    login = json['login'];
  }
  bool? login;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login'] = login;
    return map;
  }
}
