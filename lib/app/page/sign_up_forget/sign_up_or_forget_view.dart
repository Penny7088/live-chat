import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_chat/app/local/local_key.dart';
import 'package:live_chat/app/widget/app_button.dart';
import 'package:live_chat/app/widget/app_text_field.dart';
import 'package:live_chat/app/widget/count_down_view.dart';
import 'package:live_chat/app/widget/theme_widget_util.dart';
import 'package:live_chat/base/utils/log_util.dart';
import 'package:live_chat/base/utils/text_styles.dart';
import 'package:live_chat/base/view/common_base_view.dart';

import '../../../base/config/normal_colors.dart';
import '../../../base/utils/decorations.dart';
import 'sign_up_or_forget_logic.dart';
import 'sign_up_or_forget_state.dart';

class SignUpOrForgetPage extends CommonBaseView<SignUpOrForgetController> {
  SignType? signType;

  SignUpOrForgetPage({Key? key, this.signType}) : super(key: key);

  @override
  SignUpOrForgetState get state => controller.state;

  @override
  String controllerTag() {
    logD('controllerTag = $signType');
    return 'SignUpOrForgetPage$signType';
  }

  @override
  Widget createChildBody({required BuildContext context, BoxConstraints? constraints}) {
    return GetBuilder(
        init: controller,
        builder: (controller) {
          return Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              decoration: BoxDecoration(image: DecorationImage(image: themeBgImage(), fit: BoxFit.cover)),
              child: Stack(children: [
                Column(children: [
                  Container(
                    width: 1.sw,
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 45.h),
                    child: backWidget(),
                  ),
                  60.verticalSpaceFromWidth,
                  Container(
                      width: 1.sw,
                      alignment: Alignment.topLeft,
                      child: Text(
                        state.type == SignType.forget ? LanguageKey.resetPassword.tr : LanguageKey.signUp.tr,
                        style: boldTextStyle(size: 36, color: col333333),
                      )),
                  30.verticalSpaceFromWidth,
                  AppTextField(
                    controller: state.emailController,
                    textFieldType: TextFieldType.EMAIL,
                    title: LanguageKey.loginButtonEmail.tr,
                    decoration: defaultInputDecoration(
                        hint: LanguageKey.loginButtonEmail.tr, textStyle: editHintStyle(), borderRadius: 15.r),
                  ),
                  15.verticalSpaceFromWidth,
                  AppTextField(
                    title: LanguageKey.password.tr,
                    isPassword: true,
                    controller: state.passwordController,
                    textFieldType: TextFieldType.PASSWORD,
                    suffixIconColor: col999999.withOpacity(0.5),
                    decoration: defaultInputDecoration(
                        hint: LanguageKey.newPasswordHint.tr, textStyle: editHintStyle(), borderRadius: 15.r),
                  ),
                  15.verticalSpaceFromWidth,
                  AppTextField(
                    title: LanguageKey.confirmPasswordHint.tr,
                    isPassword: true,
                    controller: state.passwordController,
                    textFieldType: TextFieldType.PASSWORD,
                    suffixIconColor: col999999.withOpacity(0.5),
                    decoration: defaultInputDecoration(
                        hint: LanguageKey.confirmPasswordHint.tr, textStyle: editHintStyle(), borderRadius: 15.r),
                  ),
                  15.verticalSpaceFromWidth,
                  Container(
                      width: 1.sw,
                      alignment: Alignment.topLeft,
                      child: CountdownWidget(
                        total: 60,
                        height: 40.w,
                        width: 120.w,
                        textStyle: primaryTextStyle(size: 12),
                        borderRadius: 10.r,
                        onClick: () {
                          controller.fetchVerificationCode();
                        },
                      ))
                ]),
                Positioned(
                    left: 0.w,
                    right: 0.w,
                    bottom: 30.h,
                    child: AppButton(
                      onTap: () async {
                        controller.signUpOrResetPassword();
                      },
                      shapeBorder: RoundedRectangleBorder(
                        borderRadius: radius(15.r),
                      ),
                      elevation: 8.0,
                      shadowColor: Colors.black.withOpacity(0.5),
                      buttonSize: Size(1.sw, 50.w),
                      space: 20.w,
                      appButtonEnum: AppButtonEnum.onlyText,
                      text: state.type == SignType.forget ? LanguageKey.resetPassword.tr : LanguageKey.signUp.tr,
                      color: colffffff,
                      disabledColor: colffffff,
                      textStyle: boldTextStyle(color: col333333),
                    ))
              ]));
        });
  }

  @override
  SignUpOrForgetController createController() {
    return SignUpOrForgetController();
  }
}
