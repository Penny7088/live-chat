import 'dart:io';
import 'dart:typed_data';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:live_chat/base/config/normal_colors.dart';
import 'package:live_chat/base/utils/extensions/context_extensions.dart';
import 'package:live_chat/base/utils/log_util.dart';
import 'package:live_chat/base/utils/text_styles.dart';
import 'package:live_chat/base/view/snack_bar/awesome_snackbar_content.dart';
import 'package:live_chat/base/view/snack_bar/content_type.dart' as content;

import 'date_picker/date_picker.dart';
import 'date_picker/date_picker_constants.dart';
import 'date_picker/date_picker_theme.dart';
import 'date_picker/i18n/date_picker_i18n.dart';
import 'image/extended_image_widget.dart';

assetImage({required String url, double? width, double? height, BoxFit? fit = BoxFit.cover}) {
  return Image.asset(url, width: width, height: height, fit: fit);
}

commonText({required String text, TextStyle? style}) {
  return Text(text.tr, style: style);
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

Widget columnTextAndAny({required Widget any, required String text, TextStyle? style}) {
  return Column(mainAxisSize: MainAxisSize.min, children: [Text(text, style: style ?? secondaryTextStyle()), any]);
}

withHeroNetImageWidget(
    {String? url,
    double? width,
    double? height,
    Uint8List? bytes,
    String? assetPath,
    File? imageFile,
    int index = -1,
    BoxFit? fit,
    double? radius}) {
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
      heroStr: heroStr);
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

const String MIN_DATETIME = '1940-01-30';
const String MAX_DATETIME = '2030-12-31';
const String INIT_DATETIME = '2007-05-17';

showDatePikerDialog(DateValueCallback onConfirm) {
  DatePicker.showDatePicker(
    Get.context!,
    onMonthChangeStartWithFirstDate: true,
    pickerTheme: DateTimePickerTheme(
      showTitle: true,
      confirm: Text('Done', style: boldTextStyle()),
    ),
    minDateTime: DateTime.parse(MIN_DATETIME),
    maxDateTime: DateTime.parse(MAX_DATETIME),
    dateFormat: 'yyyy-MMMM-dd',
    locale: DateTimePickerLocale.en_us,
    onClose: () => logD("----- onClose -----"),
    onCancel: () => logD('onCancel'),
    onChange: (dateTime, List<int> index) {},
    onConfirm: (dateTime, List<int> index) {
      onConfirm(dateTime, index);
    },
  );
}

/// show snack bar
/// [context]
/// [title]. 标题
/// [contentType]. [contentType.ContentType]
showSnackBar(
    {required BuildContext context,
    required String title,
    required content.ContentType contentType,
    String? content,
    Color? backgroundColor,
    bool? forceActionsBelow,
    bool? inMaterialBanner,
    SnackBarBehavior? behavior}) {
  var awesomeSnackBarContent = AwesomeSnackBarContent(
    title: title,
    message: content ?? "",
    contentType: contentType,
    inMaterialBanner: inMaterialBanner ?? false,
  );

  if (inMaterialBanner ?? false) {
    var materialBanner = MaterialBanner(
        elevation: 0,
        backgroundColor: backgroundColor,
        forceActionsBelow: forceActionsBelow ?? true,
        content: awesomeSnackBarContent,
        actions: const [SizedBox.shrink()]);
    ScaffoldMessenger.of(context)
      ..hideCurrentMaterialBanner()
      ..showMaterialBanner(materialBanner);
  } else {
    var snackBar = SnackBar(
        elevation: 0,
        behavior: behavior ?? SnackBarBehavior.floating,
        backgroundColor: backgroundColor ?? Colors.transparent,
        content: awesomeSnackBarContent);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

/// showToast
showToast(String message, {ToastGravity? gravity, Toast? toastLength}) {
  Fluttertoast.showToast(
      msg: message, gravity: gravity ?? ToastGravity.CENTER, toastLength: toastLength ?? Toast.LENGTH_SHORT);
}
