/// age : 0
/// countryID : 0
/// deviceToken : "string"
/// email : "string"
/// emailVerified : 0
/// gender : "string"
/// id : 0
/// interests : "string"
/// isNewUser : true
/// languageLevel : "string"
/// lastLogin : "string"
/// learningLanguageID : 0
/// nativeLanguageID : 0
/// passwordHash : "string"
/// platform : "string"
/// profilePicture : "string"
/// refreshToken : "string"
/// registrationDate : "string"
/// status : "string"
/// token : "string"
/// tokenExpiration : "string"
/// username : "string"
/// verificationToken : "string"

class UserModel {
  UserModel({
      this.age, 
      this.countryID, 
      this.deviceToken, 
      this.email, 
      this.emailVerified, 
      this.gender, 
      this.id, 
      this.interests, 
      this.isNewUser, 
      this.languageLevel, 
      this.lastLogin, 
      this.learningLanguageID, 
      this.nativeLanguageID, 
      this.passwordHash, 
      this.platform, 
      this.profilePicture, 
      this.refreshToken, 
      this.registrationDate, 
      this.status, 
      this.token, 
      this.tokenExpiration, 
      this.username, 
      this.verificationToken,});

  UserModel.fromJson(dynamic json) {
    age = json['age'];
    countryID = json['countryID'];
    deviceToken = json['deviceToken'];
    email = json['email'];
    emailVerified = json['emailVerified'];
    gender = json['gender'];
    id = json['id'];
    interests = json['interests'];
    isNewUser = json['isNewUser'];
    languageLevel = json['languageLevel'];
    lastLogin = json['lastLogin'];
    learningLanguageID = json['learningLanguageID'];
    nativeLanguageID = json['nativeLanguageID'];
    passwordHash = json['passwordHash'];
    platform = json['platform'];
    profilePicture = json['profilePicture'];
    refreshToken = json['refreshToken'];
    registrationDate = json['registrationDate'];
    status = json['status'];
    token = json['token'];
    tokenExpiration = json['tokenExpiration'];
    username = json['username'];
    verificationToken = json['verificationToken'];
  }
  num? age;
  num? countryID;
  String? deviceToken;
  String? email;
  num? emailVerified;
  String? gender;
  int? id;
  String? interests;
  bool? isNewUser;
  String? languageLevel;
  String? lastLogin;
  num? learningLanguageID;
  num? nativeLanguageID;
  String? passwordHash;
  String? platform;
  String? profilePicture;
  String? refreshToken;
  String? registrationDate;
  String? status;
  String? token;
  String? tokenExpiration;
  String? username;
  String? verificationToken;


  bool avatarNullOrFile(){
    return profilePicture == null || profilePicture?.isEmpty == true || (profilePicture?.startsWith('https//')??false);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['age'] = age;
    map['countryID'] = countryID;
    map['deviceToken'] = deviceToken;
    map['email'] = email;
    map['emailVerified'] = emailVerified;
    map['gender'] = gender;
    map['id'] = id;
    map['interests'] = interests;
    map['isNewUser'] = isNewUser;
    map['languageLevel'] = languageLevel;
    map['lastLogin'] = lastLogin;
    map['learningLanguageID'] = learningLanguageID;
    map['nativeLanguageID'] = nativeLanguageID;
    map['passwordHash'] = passwordHash;
    map['platform'] = platform;
    map['profilePicture'] = profilePicture;
    map['refreshToken'] = refreshToken;
    map['registrationDate'] = registrationDate;
    map['status'] = status;
    map['token'] = token;
    map['tokenExpiration'] = tokenExpiration;
    map['username'] = username;
    map['verificationToken'] = verificationToken;
    return map;
  }

}