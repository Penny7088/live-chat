import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_chat/base/config/normal_colors.dart';
import 'package:live_chat/base/utils/text_styles.dart';

import '../local/local_key.dart';

class LanguageView extends StatelessWidget {
  final Color circleColor;
  final Color defaultColor;
  final String text;
  final double? hPadding;
  final double? vPadding;
  final int? circleLength;
  final Size circleSize;
  ///0 - 4
  final int level;
  const LanguageView({
    super.key,
    required this.circleColor,
    required this.defaultColor,
    required this.text,
    required this.circleSize,
    required this.level,
    this.hPadding,
    this.vPadding,
    this.circleLength = 5,
  });


  factory LanguageView.started(){
    return LanguageView(
        circleColor: col89F1F5,
        defaultColor: col535353,
        text: LanguageKey.started.tr,
        circleSize: Size(20.w, 20.w),
        level: 0);
  }

  factory LanguageView.beginner(){
    return LanguageView(
        circleColor: col0B99FF,
        defaultColor: col535353,
        text: LanguageKey.beginner.tr,
        circleSize: Size(20.w, 20.w),
        level: 1);
  }

  factory LanguageView.intermediate(){
    return LanguageView(
        circleColor: colff9100,
        defaultColor: col535353,
        text: LanguageKey.intermediate.tr,
        circleSize: Size(20.w, 20.w),
        level: 2);
  }

  factory LanguageView.advanced(){
    return LanguageView(
        circleColor: colff9100,
        defaultColor: col535353,
        text: LanguageKey.advanced.tr,
        circleSize: Size(20.w, 20.w),
        level: 3);
  }

  factory LanguageView.master(){
    return LanguageView(
        circleColor: col36b2b5,
        defaultColor: col535353,
        text: LanguageKey.master.tr,
        circleSize: Size(20.w, 20.w),
        level: 4);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text, style: boldTextStyle(size: 18, color: col000000)),
        5.verticalSpace,
        Row(children: _buildCircleView())
      ],
    ).paddingSymmetric(horizontal: hPadding ?? 0, vertical: vPadding ?? 0);
  }

  List<Widget> _buildCircleView() {
    List<Widget> circles = [];
    int length = circleLength ?? 5;
    for (int i = 0; i < length; i++) {
      circles.add(Container(
        width: circleSize.width,
        height: circleSize.height,
        decoration: ShapeDecoration(
          color: i <= level ? circleColor : defaultColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.r),
          ),
        ),
      ));
    }
    return circles;
  }
}
