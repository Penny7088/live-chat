class LoginRegBody{
  String? deviceToken;
  String? idToken;
  String? platform;
}

class RegisterReqBody{
  String? code;
  String? email;
  String? password;
  String? newPassword;


  RegisterReqBody({this.code, this.email, this.password, this.newPassword});

  Map<String, dynamic> toJson() =>
      {
        'code': code,
        'email': email,
        'password': password,
        'newPassword': newPassword,
      };
}