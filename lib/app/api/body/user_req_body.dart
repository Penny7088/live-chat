/// age : 0
/// birthDate : "string"
/// countryID : 0
/// email : "string"
/// gender : "string"
/// id : 0
/// interests : [0]
/// languageLevel : "string"
/// learningLanguageID : 0
/// nativeLanguageID : 0
/// passwordHash : "string"
/// profilePicture : "string"
/// username : "string"

class UserReqBody {
  UserReqBody({
      this.age, 
      this.birthDate, 
      this.countryID, 
      this.email, 
      this.gender, 
      this.id, 
      this.interests, 
      this.languageLevel, 
      this.learningLanguageID, 
      this.nativeLanguageID, 
      this.passwordHash, 
      this.profilePicture, 
      this.username,});

  UserReqBody.fromJson(dynamic json) {
    age = json['age'];
    birthDate = json['birthDate'];
    countryID = json['countryID'];
    email = json['email'];
    gender = json['gender'];
    id = json['id'];
    interests = json['interests'] != null ? json['interests'].cast<num>() : [];
    languageLevel = json['languageLevel'];
    learningLanguageID = json['learningLanguageID'];
    nativeLanguageID = json['nativeLanguageID'];
    passwordHash = json['passwordHash'];
    profilePicture = json['profilePicture'];
    username = json['username'];
  }
  num? age;
  String? birthDate;
  num? countryID;
  String? email;
  String? gender;
  num? id;
  List<num>? interests;
  String? languageLevel;
  num? learningLanguageID;
  num? nativeLanguageID;
  String? passwordHash;
  String? profilePicture;
  String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['age'] = age;
    map['birthDate'] = birthDate;
    map['countryID'] = countryID;
    map['email'] = email;
    map['gender'] = gender;
    map['interests'] = interests;
    map['languageLevel'] = languageLevel;
    map['learningLanguageID'] = learningLanguageID;
    map['nativeLanguageID'] = nativeLanguageID;
    map['profilePicture'] = profilePicture;
    map['username'] = username;
    return map;
  }

}