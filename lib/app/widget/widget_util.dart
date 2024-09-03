import 'dart:io';
import 'dart:typed_data';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_chat/base/config/normal_colors.dart';
import 'package:live_chat/base/utils/extensions/context_extensions.dart';
import 'package:live_chat/base/utils/text_styles.dart';

import 'image/extended_image_widget.dart';

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


withHeroNetImageWidget({
  String? url,
  double? width,
  double? height,
  Uint8List? bytes,
  String? assetPath,
  File? imageFile,
  int index = -1,
  double? radius
}) {
  String heroStr = index != -1 ? "ImageHero$index" : (url ?? "tag");
  Widget body = createImage(
    url: url,
    bytes: bytes,
    assetPath: assetPath,
    imageFile: imageFile,
    fit: BoxFit.cover,
    width: width,
    height: height,
    loadRadius: radius,
    heroStr: heroStr
  );
  return body;
}


Widget createImage({
  String? url,
  Uint8List? bytes,
  String? assetPath,
  File? imageFile,
  double? width,
  double? height,
  BorderRadius? borderRadius = BorderRadius.zero,
  String? placeholder,
  double? loadRadius,
  BoxFit fit = BoxFit.fill,
  String? heroStr,
}) {
  return ExtendedImageWidget.configImage(
    imageUrl: url,
    bytes: bytes,
    assetPath: assetPath,
    imageFile: imageFile,
    width: width,
    height: height,
    borderRadius: borderRadius,
    fit: fit,
    loadRadius: loadRadius,
    heroStr: heroStr,
  );
}


createImageLoadWidget({
  double? width,
  double? height,
}) {
  Widget body = AnimatedTextKit(
    animatedTexts: [
      WavyAnimatedText('Live Chat'),
    ],
    isRepeatingAnimation: true,
    onTap: () {},
  );

  body = Container(
    width: width,
    height: height,
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      color: cole3e3e3,
    ),
    child: body,
  );
  body = body = DefaultTextStyle(
    style: const TextStyle(
      fontSize: 20.0,
    ),
    child: body,
  );
  return body;
}