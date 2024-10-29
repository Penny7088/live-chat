/// languagess : [{"id":1,"name":"Arabic","nativeName":"العربية","isoCode":"ar"},{"id":2,"name":"German","nativeName":"Deutsch","isoCode":"de"},{"id":3,"name":"English","nativeName":"English","isoCode":"en"},{"id":4,"name":"Portuguese","nativeName":"Português","isoCode":"pt"},{"id":5,"name":"French","nativeName":"Français","isoCode":"fr"},{"id":6,"name":"Chinese Simplified","nativeName":"简体中文","isoCode":"zh-Hans"},{"id":7,"name":"Chinese Traditional","nativeName":"繁體中文","isoCode":"zh-Hant"},{"id":8,"name":"Italian","nativeName":"Italiano","isoCode":"it"},{"id":9,"name":"Japanese","nativeName":"日本語","isoCode":"ja"},{"id":10,"name":"Korean","nativeName":"한국어","isoCode":"ko"},{"id":11,"name":"Spanish","nativeName":"Español","isoCode":"es"},{"id":12,"name":"Russian","nativeName":"Русский","isoCode":"ru"},{"id":13,"name":"Thai","nativeName":"ไทย","isoCode":"th"},{"id":14,"name":"Vietnamese","nativeName":"Tiếng Việt","isoCode":"vi"},{"id":15,"name":"Ukrainian","nativeName":"Українська","isoCode":"uk"}]

class LanguageModel {
  LanguageModel({
      this.languagess,});

  LanguageModel.fromJson(dynamic json) {
    if (json['languagess'] != null) {
      languagess = [];
      json['languagess'].forEach((v) {
        languagess?.add(Languagess.fromJson(v));
      });
    }
  }
  List<Languagess>? languagess;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (languagess != null) {
      map['languagess'] = languagess?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


/// id : 1
/// name : "Arabic"
/// nativeName : "العربية"
/// isoCode : "ar"

class Languagess {
  Languagess({
      this.id, 
      this.name, 
      this.nativeName, 
      this.isoCode,});

  Languagess.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nativeName = json['nativeName'];
    isoCode = json['isoCode'];
  }
  num? id;
  String? name;
  String? nativeName;
  String? isoCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['nativeName'] = nativeName;
    map['isoCode'] = isoCode;
    return map;
  }

}