import 'package:live_chat/app/net/http_response.dart';

import 'mixin_api_fetch.dart';

class LoginFetch with ApiFetch {
  Future<ApiResponse> resetPasswordVerificationCode({required String email}) async {
    var apiResponse =
        await request(path: '/v1/globalConfig/sendResetPasswordCode', data: {'email': email}, method: Method.post,isFormData: false);
    return apiResponse;
  }

  Future<ApiResponse> signUpPasswordVerificationCode({required String email}) async {
    var apiResponse =
        await request(path: '/v1/globalConfig/sendSignUpVerifyCode', data: {'email': email}, method: Method.post,isFormData: false);
    return apiResponse;
  }

  Future<ApiResponse> signUpForEmail({required String email, required String password, required String code}) async {
    var apiResponse = await request(
        path: '/v1/users/signUpFromEmail',
        data: {'email': email, 'password': password, 'code': code},
        method: Method.post);
    return apiResponse;
  }

  Future<ApiResponse> loginForEmail({required String email, required String password}) async {
    var apiResponse = await request(
        path: '/v1/users/loginFromEmail',
        data: {'email': email, 'password': password},
        method: Method.post);
    return apiResponse;
  }
}
