import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_chat/base/config/normal_colors.dart';
import 'package:live_chat/base/utils/extensions/context_extensions.dart';

import '../../../../base/utils/decorations.dart';
import '../../../../base/utils/text_styles.dart';
import '../../../../base/view/common_base_view.dart';
import '../../../../generated/assets.dart';
import '../../../local/local_key.dart';
import '../../../widget/app_button.dart';
import '../../../widget/horizontal_line.dart';
import '../../../widget/theme_widget_util.dart';
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

    return Stack(
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
  }

  @override
  InformationController createController() {
    return Get.put(InformationController());
  }

  Widget createInformationView(double statusBarHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        statusBarHeight.verticalSpaceFromWidth,
        stepView(),
        Expanded(child: PageView.builder(
            controller: state.pageController,
            physics:const NeverScrollableScrollPhysics(),
            onPageChanged: controller.onPageChanged,
            itemCount: state.stepLength, itemBuilder: (context, index) {
          if (index == 0) {
            return Text('avtar age birth day');
          } else if (index == 1) {
            return Text('母语 学习语');
          } else if (index == 2) {
            return Text('hobby ');
          }
        })),
        GetBuilder(
            init: controller,
            id: 'bt',
            builder: (controller) {
              return AppButton(
                onTap:(){controller.clickStep();} ,
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
              );
            })

      ],
    );
  }

  /// 1 - 2 - 完成
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
                    lineColor: state.stepIndex >= 1 ? col000000 : col333333
                        .withAlpha(50),
                    width: 90.w,
                    height: 2.w,
                    strokeWidth: 2),
                10.horizontalSpace,
                Text(
                  ' 2 ',
                  style: boldTextStyle(color: state.stepIndex >= 1 ? col000000 : col333333
                      .withAlpha(50)),
                ),
                10.horizontalSpace,
                HorizontalLine(
                    lineColor: state.stepIndex == 2 ? col000000 : col333333
                        .withAlpha(50),
                    width: 90.w,
                    height: 2.w,
                    strokeWidth: 2),
                8.horizontalSpace,
                Text(
                  'Done',
                  style: boldTextStyle(color: state.stepIndex == 2 ? col000000 : col333333
                      .withAlpha(50)),
                ),
              ],
            ),
          );
        });
  }
}
