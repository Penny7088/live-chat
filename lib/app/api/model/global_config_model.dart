import 'package:live_chat/app/model/country_entity.dart';
import 'package:live_chat/app/model/language_model.dart';

/// loginMethods : [{"name":"string"}]

class GlobalConfigModel {
  GlobalConfigModel({this.loginMethod, this.languages, this.countries});

  GlobalConfigModel.fromJson(dynamic json) {
    if (json['loginMethod'] != null) {
      loginMethod = LoginMethods.fromJson(json['loginMethod']);
    }
    if (json['countries'] != null) {
      countries = [];
      json['countries'].forEach((v) {
        countries?.add(Countries.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      languages = [];
      json['languages'].forEach((v) {
        languages?.add(Languages.fromJson(v));
      });
    }
  }

  LoginMethods? loginMethod;
  List<Countries>? countries;
  List<Languages>? languages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['loginMethods'] = LoginMethods().toJson();
    return map;
  }
}

/// name : "string"

class LoginMethods {
  LoginMethods({
    this.name,
  });

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
