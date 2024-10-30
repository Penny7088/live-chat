import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/widget/horizontal_line.dart';
import '../config/normal_colors.dart';

/// FileName util
///
/// @Author mac
/// @Date 2024/5/28 21:01
///
/// @Description TODO

keyDismiss(
    BuildContext context,
    ) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

requestFocus(
    BuildContext context,
    ) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.requestFocus();
  }
}

bool hasMatch(String? s, String p) {
  return (s == null) ? false : RegExp(p).hasMatch(s);
}

setDataToClipboard({
  required String text,
}) async {
  await Clipboard.setData(ClipboardData(text: text));
}

getDataToClipboard() {
  return Clipboard.getData(Clipboard.kTextPlain);
}

/// dividing line
dividingLine({Color? lineColor, double? width, double? height}) {
  return HorizontalLine(
      lineColor: lineColor ?? cole3e3e3.withAlpha(100),
      width: width ?? 1.sw * 0.8,
      height: height ?? 1.w,
      strokeWidth: 2.w);
}