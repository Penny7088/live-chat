import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../generated/assets.dart';

class LoadingWidget extends StatelessWidget {
  final double? width;

  final double? height;

  const LoadingWidget({super.key, this.width = 80, this.height = 80});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child:
      Lottie.asset(
        Assets.loadingSplashLoading,
        height: 88.w,
        width: 88.w,
        alignment: Alignment.center,
      ));
  }
}
