import 'package:get/get.dart';
import 'package:live_chat/app/local/local_key.dart';
import 'package:live_chat/base/controller/common_controller.dart';
import 'package:live_chat/base/utils/log_util.dart';

import '../../../base/utils/pattern.dart';
import '../../../base/utils/util.dart';
import '../../api/body/req_body.dart';
import '../../net/http_response.dart';
import 'sign_up_or_forget_state.dart';
import '../../widget/widget_util.dart';

class SignUpOrForgetController extends CommonController<SignUpOrForgetState> {
  @override
  SignUpOrForgetState createState() {
    return SignUpOrForgetState();
  }

  Future<void> fetchVerificationCode() async {
    bool isForget = state.type == SignType.forget;
    var email = state.emailController.text;
    if (email.isEmpty) {
      logD('输入邮箱..');
      return;
    }

    var hasMatched = hasMatch(email, Patterns.emailEnhanced);
    if(!hasMatched){
      logD('邮箱格式不正确..');
      return;
    }

    ApiResponse rsp;
    if (isForget) {
      rsp = await state.fetch.resetPasswordVerificationCode(email: email);
    } else {
      rsp = await state.fetch.signUpPasswordVerificationCode(email: email);
    }
    if (rsp.ok) {
      logD('验证码发送成功');
    }else{
      logD('验证码发送失败,稍后请重试');
    }
  }

  void signUpOrResetPassword() {
    var email = state.emailController.text;
    var hasMatched = hasMatch(email, Patterns.emailEnhanced);
    if(!hasMatched){
      logD('邮箱格式不正确..');
      return;
    }

    var pwd = state.passwordController.text;
    var confirmPwd = state.confirmPasswordController.text;
    if(pwd != confirmPwd){
      logD('密码不一致..');
      showToast(LanguageKey.passwordsAreInconsistent.tr);
      return;
    }

    var code = state.codeController.text;
    if(code.isEmpty && code.length != 6){
      logD('验证码格式不正确..');
      showToast(LanguageKey.verificationCodeFormatIncorrect.tr);
      return;
    }
    bool isForget = state.type == SignType.forget;
    var body = RegisterReqBody(code,email,pwd);
    if (isForget) {
      fetchResetPassword(body);
    }else{
      fetchRegister(body);
    }
  }

  Future<void> fetchRegister(RegisterReqBody body) async {

    var signUpForEmail = await state.fetch.signUpForEmail(body: body);

  }

  Future<void> fetchResetPassword(RegisterReqBody body) async {
    var reset = await state.fetch.resetPassword(body: body);

  }

}
