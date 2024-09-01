
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_chat/base/utils/extensions/context_extensions.dart';
import 'package:live_chat/base/utils/text_styles.dart';

assetImage({required String url,double? width,double? height,BoxFit? fit = BoxFit.cover}){
  return Image.asset(url,width: width,height: height,fit: fit);
}

commonText({required String text,TextStyle? style}){
  return Text(text.tr,style: style);
}

EdgeInsets dynamicAppButtonPadding(BuildContext context) {
  if (context.isDesktop()) {
    return EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.w);
  } else if (context.isTabletP()) {
    return EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.w);
  } else {
    return EdgeInsets.symmetric(vertical: 14.w, horizontal: 16.w);
  }
}


Widget columnTextAndAny({required Widget any,required String text,TextStyle? style}){
  return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
    Text(text,style: style?? secondaryTextStyle()),
    any
  ]);
}