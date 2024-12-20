/// loginMethods : [{"name":"string"}]

class GlobalConfigModel {
  GlobalConfigModel({
      this.loginMethod});

  GlobalConfigModel.fromJson(dynamic json) {
    if (json['loginMethod'] != null) {
        loginMethod = LoginMethods.fromJson(json['loginMethod']);
    }
  }
  LoginMethods? loginMethod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['loginMethods'] = LoginMethods().toJson();
    return map;
  }
}


/// name : "string"

class LoginMethods {
  LoginMethods({
      this.name,});

  LoginMethods.fromJson(dynamic json) {
    name = json['name'];
  }
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    return map;
  }

}