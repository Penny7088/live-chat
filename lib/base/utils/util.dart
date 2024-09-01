import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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