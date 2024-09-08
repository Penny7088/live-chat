import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_chat/app/widget/app_text_field.dart';
import 'package:live_chat/app/widget/date_picker/date_picker_theme.dart';
import 'package:live_chat/app/widget/user_avatar_view.dart';
import 'package:live_chat/base/config/normal_colors.dart';
import 'package:live_chat/base/utils/extensions/context_extensions.dart';
import 'package:live_chat/base/utils/extensions/widget_extensions.dart';

import '../../../../base/utils/decorations.dart';
import '../../../../base/utils/text_styles.dart';
import '../../../../base/view/common_base_view.dart';
import '../../../../generated/assets.dart';
import '../../../local/local_key.dart';
import '../../../widget/app_button.dart';
import '../../../widget/date_picker/date_picker.dart';
import '../../../widget/horizontal_line.dart';
import '../../../widget/setting_item_widget.dart';
import '../../../widget/theme_widget_util.dart';
import '../../../widget/widget_util.dart';
import 'information_logic.dart';
import 'information_state.dart';

class InformationPage extends CommonBaseView<InformationController> {
  const InformationPage({super.key});

  @override
  InformationState get state => controller.state;

  @override
  String controllerTag() {
    return hashCode.toString();
  }

  @override
  Widget createChildBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = createInformationView(context.statusBarHeight);
    body = Stack(
      alignment: Alignment.center,
      children: [
        Container(
            width: 1.sw,
            height: 1.sh,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: themeBgImage(isDark: state.themeValue.value),
                    fit: BoxFit.cover))),
        body
      ],
    );
    return Material(child: body);
  }

  @override
  InformationController createController() {
    return Get.put(InformationController());
  }

  Widget createInformationView(double statusBarHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        statusBarHeight.verticalSpaceFromWidth,
        appBar(),
        stepView(),
        Expanded(child: exBody()),
        bottomButton()
      ],
    );
  }

  PageView exBody() {
    return PageView.builder(
        controller: state.pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: controller.onPageChanged,
        itemCount: state.stepLength,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _userInfo();
          } else if (index == 1) {
            return _languagePage();
          } else {
            return Text('hobby ');
          }
        });
  }

  Widget bottomButton() {
    return GetBuilder(
        init: controller,
        id: 'bt',
        builder: (controller) {
          return AppButton(
            onTap: () {
              controller.clickStep();
            },
            margin: EdgeInsets.only(bottom: 50.w),
            shapeBorder: RoundedRectangleBorder(
              borderRadius: radius(20),
            ),
            elevation: 8.0,
            shadowColor: Colors.black.withOpacity(0.5),
            buttonSize: Size(354.w, 44.w),
            appButtonEnum: AppButtonEnum.onlyText,
            text: state.stepIndex == 2
                ? LanguageKey.loginInfoDone.tr
                : LanguageKey.loginInfoNext.tr,
            iconUrl: Assets.svgGoogleLogo,
            color: colffffff,
            disabledColor: colffffff,
            textStyle: boldTextStyle(color: col000000),
          ).center();
        });
  }

  Widget stepView() {
    return GetBuilder(
        id: 'step',
        init: controller,
        builder: (controller) {
          return Container(
            width: 1.sw,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ' 1 ',
                  style: boldTextStyle(),
                ),
                10.horizontalSpace,
                HorizontalLine(
                    lineColor: state.stepIndex >= 1
                        ? col000000
                        : col333333.withAlpha(50),
                    width: 90.w,
                    height: 2.w,
                    strokeWidth: 2),
                10.horizontalSpace,
                Text(
                  ' 2 ',
                  style: boldTextStyle(
                      color: state.stepIndex >= 1
                          ? col000000
                          : col333333.withAlpha(50)),
                ),
                10.horizontalSpace,
                HorizontalLine(
                    lineColor: state.stepIndex == 2
                        ? col000000
                        : col333333.withAlpha(50),
                    width: 90.w,
                    height: 2.w,
                    strokeWidth: 2),
                8.horizontalSpace,
                Text(
                  'Done',
                  style: boldTextStyle(
                      color: state.stepIndex == 2
                          ? col000000
                          : col333333.withAlpha(50)),
                ),
              ],
            ),
          );
        });
  }

  Widget appBar() {
    return GetBuilder(
      id: 'back',
      builder: (InformationController controller) {
        return Container(
          margin: EdgeInsets.only(left: 16.w, bottom: 20.w),
          child: AppButton(
            onTap: () {
              controller.preStep();
            },
            shapeBorder: RoundedRectangleBorder(
              borderRadius: radius(16),
            ),
            elevation: 8.0,
            shadowColor: Colors.black.withOpacity(0.5),
            buttonSize: Size(40.w, 40.w),
            appButtonEnum: AppButtonEnum.onlyIcon,
            iconUrl: Assets.svgAppBack,
            color: colffffff,
            disabledColor: colffffff,
            iconSize: Size(17.w, 22.w),
          ),
        ).visible(state.stepIndex > 0, defaultWidget: SizedBox(height: 63.w));
      },
    );
  }

  /// 个人信息
  Widget _userInfo() {
    Widget body = Column(children: [
      40.verticalSpaceFromWidth,
      Text(LanguageKey.loginInfoComplete.tr, style: boldTextStyle(size: 20)),
      Text(LanguageKey.loginInfoRecommendPartner.tr,
          style: boldTextStyle(size: 20)),
      30.verticalSpaceFromWidth,
      UserAvatarView(
        url:
            'https://cdn.pixabay.com/photo/2024/01/25/10/50/mosque-8531576_1280.jpg',
        width: 80.w,
        height: 80.w,
        type: ImageType.netWork,
        ifEdit: true,
      ),
      28.verticalSpaceFromWidth,
      Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: AppTextField(
            controller: state.textEditingController,
            textFieldType: TextFieldType.NAME,
            decoration: defaultInputDecoration(),
            onChanged: (value){
              controller.setNickName(value);
            },
          )),
      15.verticalSpaceFromWidth,
      GetBuilder(
          init: controller,
          id: 'birthday',
          builder: (controller) {
            return Container(
                decoration: boxDecorationDefault(
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      color: col89F1F5,
                      width: 1.5.w,
                    )),
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                child: SettingItemWidget(
                  title: state.birthday ?? LanguageKey.loginInfoBirthday.tr,
                  decoration: BoxDecoration(borderRadius: radius()),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded,
                      color: col333333),
                  onTap: () {
                    showDatePikerDialog((dateTime, List<int> index) {
                      controller.onBirthdayCallback(dateTime, index);
                    });
                  },
                ));
          }),
      15.verticalSpaceFromWidth,
      GetBuilder(
          init: controller,
          id: 'sex',
          builder: (controller) {
            return Container(
                width: 1.sw,
                height: 40.w,
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Container(
                    height: 40.w,
                    alignment: Alignment.center,
                    decoration:
                        BoxDecoration(
                            color: state.ifFemale ?? false ? col89F1F5 : colF7F7F7,
                            borderRadius: BorderRadius.circular(30.0)),
                    child: Text(LanguageKey.loginInfoFeMale.tr,
                        style: boldTextStyle(color: (state.ifFemale ?? false)?col333333:col7f7f7f)),
                  ).onTap((){
                    controller.selectSex(true);
                  },borderRadius:  BorderRadius.circular(30.0),).expand(),
                  10.horizontalSpace,
                  Container(
                    height: 40.w,
                    alignment: Alignment.center,
                    decoration:
                    BoxDecoration(
                        color: (state.ifMale ?? false) ? col89F1F5 : colF7F7F7,
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Text(LanguageKey.loginInfoMale.tr,
                        style: boldTextStyle(color:  (state.ifMale ?? false)?col333333:col7f7f7f)),
                  ).onTap((){
                    controller.selectSex(false);
                  },borderRadius:  BorderRadius.circular(30.0),).expand()
                ]));
          }),
      Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w).copyWith(top: 15.w),
          child: Text(LanguageKey.loginInfoAgeAndSex.tr,
              style: primaryTextStyle(color: col333333, size: 14)))
    ]);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: body,
    );
  }

  ///母语/学习语言
  Widget _languagePage() {




    return Container();
  }
}
