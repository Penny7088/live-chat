import 'package:get/get.dart';
import 'package:live_chat/app/local/local_key.dart';
import 'package:live_chat/app/net/http_response.dart';
import 'package:live_chat/app/tool/json_utils.dart';
import 'package:live_chat/app/widget/widget_util.dart';

import '../model/interests_model.dart';
import 'body/req_body.dart';
import 'mixin_api_fetch.dart';
import 'model/user_model.dart';

class LoginFetch with ApiFetch {
  Future<ApiResponse> resetPasswordVerificationCode({required String email}) async {
    var apiResponse = await request(
        path: '/v1/globalConfig/sendResetPasswordCode', data: {'email': email}, method: Method.post, isFormData: false);
    return apiResponse;
  }

  Future<ApiResponse> signUpPasswordVerificationCode({required String email}) async {
    var apiResponse = await request(
        path: '/v1/globalConfig/sendSignUpVerifyCode', data: {'email': email}, method: Method.post, isFormData: false);
    return apiResponse;
  }

  Future<ApiResponse> resetPassword({required RegisterReqBody body}) async {
    var apiResponse =
        await request(path: '/v1/users/resetPassword', data: body.toJson(), isFormData: false, method: Method.post);
    return apiResponse;
  }

  Future<UserModel?> signUpForEmail({required RegisterReqBody body}) async {
    var apiResponse =
        await request(path: '/v1/users/signUpFromEmail', data: body.toJson(), isFormData: false, method: Method.post);
    if (apiResponse.ok) {
      var data = apiResponse.data['user'];
      var userModel = UserModel.fromJson(data);
      return userModel;
    }else if(apiResponse.code == 20317){
      showToast(LanguageKey.verificationCodeExpiredPleaseTryAgain.tr);
    }else if(apiResponse.code == 20311){
      showToast(LanguageKey.emailIsRegistered.tr);
    }else{
      showToast(LanguageKey.registrationFailed.tr);
    }
    return null;
  }

  Future<UserModel?> loginForEmail({required String email, required String password}) async {
    var apiResponse = await request(
        path: '/v1/users/loginFromEmail',
        data: {'email': email, 'password': password},
        method: Method.post,
        isFormData: false);
    if (apiResponse.ok) {
      var userModel = UserModel.fromJson(apiResponse.data);
      return userModel;
    } else {
      showToast(LanguageKey.loginFailed.tr);
      return null;
    }
  }

  Future<List<Interestss>?> fetchInterestList({required String lanCode}) async {
    var apiResponse = await request(path: '/v1/interests/allList/$lanCode', method: Method.get);
    if (apiResponse.ok) {
      var objectList = JsonUtils.getObjectList<Interestss>(apiResponse.data, (v) => Interestss.fromJson(v));
      return objectList;
    } else {
      return null;
    }
  }
}
