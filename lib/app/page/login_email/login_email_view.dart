import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_chat/app/page/sign_up_forget/sign_up_or_forget_state.dart';
import 'package:live_chat/app/router/app_router.dart';
import 'package:live_chat/app/widget/app_button.dart';
import 'package:live_chat/base/config/normal_colors.dart';
import 'package:live_chat/base/utils/extensions/widget_extensions.dart';
import 'package:live_chat/base/utils/getx_util_tool.dart';
import 'package:live_chat/base/utils/text_styles.dart';
import 'package:live_chat/base/view/common_base_view.dart';

import '../../../base/utils/decorations.dart';
import '../../local/local_key.dart';
import '../../widget/app_text_field.dart';
import '../../widget/theme_widget_util.dart';
import '../login_social/login_router.dart';
import 'login_email_logic.dart';
import 'login_email_state.dart';

class LoginEmailPage extends CommonBaseView<LoginEmailController> {
  const LoginEmailPage({super.key});

  @override
  LoginEmailState get state => controller.state;

  @override
  String controllerTag() {
    return 'LoginEmailPage';
  }

  @override
  Widget createChildBody({required BuildContext context, BoxConstraints? constraints}) {
    return Stack(
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(image: DecorationImage(image: themeBgImage(), fit: BoxFit.cover)),
            child: Column(
                children: [
              130.verticalSpaceFromWidth,
              Container(
                  width: 1.sw,
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  alignment: Alignment.topLeft,
                  child:Text(
                LanguageKey.login.tr,
                style: boldTextStyle(size: 36,color: col333333),
              )),
              50.verticalSpaceFromWidth,
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: AppTextField(
                    controller: state.emailController,
                    textFieldType: TextFieldType.EMAIL,
                    title: LanguageKey.email.tr,
                    decoration:
                        defaultInputDecoration(hint: LanguageKey.loginButtonEmail.tr, textStyle: editHintStyle(),borderRadius: 15.r),
                    onChanged: (value) {
                      // controller.setNickName(value);
                    },
                  )),
              15.verticalSpaceFromWidth,
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: AppTextField(
                    title: LanguageKey.password.tr,
                    isPassword: true,
                    controller: state.passwordController,
                    textFieldType: TextFieldType.PASSWORD,
                    suffixIconColor: col999999.withOpacity(0.5),
                    decoration: defaultInputDecoration(hint: LanguageKey.passwordHint.tr, textStyle: editHintStyle(),borderRadius: 15.r),
                    onChanged: (value) {
                      // controller.setNickName(value);
                    },
                  )),
              10.verticalSpaceFromWidth,
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  width: 1.sw,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                    Text(LanguageKey.forgetPassword.tr, style: primaryTextStyle(size: 12)).onTap(() {
                      currentToPage(name: LoginRouter.forgetPassword,arguments: SignType.forget);
                    }),
                    const Spacer(),
                    Text(
                      LanguageKey.signUp.tr,
                      style: primaryTextStyle(size: 12),
                    ).onTap(() {
                      currentToPage(name: LoginRouter.signup,arguments: SignType.signup);
                    }),
                  ]))
            ])),
        Positioned(
            left: 40.w,
            right: 40.w,
            bottom: 30.h,
            child: AppButton(
              onTap: () async {},
              shapeBorder: RoundedRectangleBorder(
                borderRadius: radius(15.r),
              ),
              elevation: 8.0,
              shadowColor: Colors.black.withOpacity(0.5),
              buttonSize: Size(80.w, 50.w),
              space: 20.w,
              appButtonEnum: AppButtonEnum.onlyText,
              text: LanguageKey.login.tr,
              color: colffffff,
              disabledColor: colffffff,
              textStyle: boldTextStyle(color: col333333),
            ))
      ],
    );
  }

  @override
  LoginEmailController createController() {
    return LoginEmailController();
  }
}
