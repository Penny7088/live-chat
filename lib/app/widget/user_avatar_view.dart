import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/assets.dart';
import 'widget_util.dart';

enum ImageType { netWork, asset, file }

class UserAvatarView extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final double? radius;
  final ImageType type;
  final bool? ifEdit;
  final String? nationality;
  final Function(bool)? clickAvatar;


  const UserAvatarView(
      {super.key,
      required this.url,
      this.width,
      this.height,
      this.radius,
      required this.type,
      this.ifEdit,
      this.nationality,
      this.clickAvatar});

  @override
  Widget build(BuildContext context) {
    Widget avatar;
    if (type == ImageType.netWork) {
      avatar = withHeroNetImageWidget(url: url, width: width ?? 50.w, height: height ?? 50.w);
    } else if (type == ImageType.asset) {
      avatar = withHeroNetImageWidget(imageFile: File(url), width: width ?? 50.w, height: height ?? 50.w);
    } else {
      avatar = withHeroNetImageWidget(assetPath: url, width: width ?? 50.w, height: height ?? 50.w);
    }
    Widget body;

    if (nationality?.isEmpty == true && ifEdit == false) {
      body = avatar;
    } else {
      body = Stack(children: [
        avatar,
        if (ifEdit == true) ...[
          Positioned(
              bottom: 0,
              right: 0,
              child: assetImage(url: Assets.loginLoginIcons, width: 20.w, height: 20.w, fit: BoxFit.cover)),
        ],
        if (nationality?.isNotEmpty == true) ...[
          Positioned(
              bottom: 0,
              right: 0,
              child: assetImage(url: Assets.svgFbLogo, width: 20.w, height: 20.w, fit: BoxFit.cover)),
        ]
      ]);
    }

    return GestureDetector(
      behavior:HitTestBehavior.opaque,
      onTap: (){
        clickAvatar?.call(ifEdit??false);
      },
      child: body,
    );
  }
}
