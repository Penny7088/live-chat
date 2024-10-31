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
  final bool? isChoose;
  ///0 - 4
  final int level;
  const LanguageView({
    super.key,
    required this.circleColor,
    required this.defaultColor,
    required this.text,
    required this.circleSize,
    required this.level,
    this.hPadding = 16,
    this.vPadding = 10,
    this.circleLength = 5,
    this.isChoose = false,
  });

  factory LanguageView.started({bool? isChoose}) {
    return LanguageView(
        circleColor: col89F1F5,
        defaultColor: cole6e6e6,
        text: LanguageKey.started.tr,
        circleSize: Size(8.w, 8.w),
        level: 0,isChoose: isChoose,);
  }

  factory LanguageView.beginner({bool? isChoose}){
    return LanguageView(
        circleColor: col0B99FF,
        defaultColor: cole6e6e6,
        text: LanguageKey.beginner.tr,
        circleSize: Size(8.w, 8.w),
        level: 1,isChoose: isChoose,);
  }

  factory LanguageView.intermediate({bool? isChoose}){
    return LanguageView(
        circleColor: colff9100,
        defaultColor: cole6e6e6,
        text: LanguageKey.intermediate.tr,
        circleSize: Size(8.w, 8.w),
        level: 2,isChoose: isChoose,);
  }

  factory LanguageView.advanced({bool? isChoose}){
    return LanguageView(
        circleColor: cole25477,
        defaultColor: cole6e6e6,
        text: LanguageKey.advanced.tr,
        circleSize: Size(8.w, 8.w),
        level: 3,
      isChoose: isChoose,);
  }

  factory LanguageView.master({bool? isChoose}){
    return LanguageView(
        circleColor: col36b2b5,
        defaultColor: cole6e6e6,
        text: LanguageKey.master.tr,
        circleSize: Size(8.w, 8.w),
        level: 4,
    isChoose: isChoose,);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: boldTextStyle(size: 14, color: isChoose ?? false ? col1877F2 : col000000)),
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
        margin: EdgeInsets.only(right: 2.w),
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
