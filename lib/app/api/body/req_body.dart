class LoginRegBody{
  String? deviceToken;
  String? idToken;
  String? platform;
}

class RegisterReqBody{
  String? code;
  String? email;
  String? password;


  RegisterReqBody(this.code, this.email, this.password);

  Map<String, dynamic> toJson() =>
      {
        'code': code,
        'email': email,
        'password': password,
      };
}