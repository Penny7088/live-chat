import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_chat/base/utils/text_styles.dart';
import 'package:live_chat/base/config/normal_colors.dart';

int defaultElevation = 4;
double defaultRadius = 8.0;
double defaultBlurRadius = 4.0;
double defaultSpreadRadius = 1.0;
double defaultAppBarElevation = 4.0;


TextStyle editHintStyle() {
  return primaryTextStyle(size: 12, color: col000000.withOpacity(0.5));
}

/// returns default InputDecoration for AppTextField widget
InputDecoration defaultInputDecoration({String? hint,
  String? label,
  TextStyle? textStyle,
  InputBorder? inputBorder,
  InputBorder? enabledBorder,
  InputBorder? focusedBorder,
  Widget? suffix,
  double? borderRadius
}) {
  return InputDecoration(
    labelText: label,
    hintText: hint,
    fillColor: colffffff,
    suffix:suffix,
    hintStyle: textStyle ?? primaryTextStyle(),
    labelStyle: textStyle ?? secondaryTextStyle(),
    border: inputBorder ?? defaultInputBorder(borderRadius: borderRadius),
    alignLabelWithHint: true,
    enabledBorder: enabledBorder ?? defaultBorder(borderRadius: borderRadius),
    focusedBorder: focusedBorder ?? defaultBorder(borderRadius: borderRadius),
  );
}

InputBorder defaultInputBorder({double? borderRadius}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius??20.0), // 设置圆角边框
    borderSide: BorderSide(
      color: colffffff, // 边框颜色
      width: 2.0.w,
    ),
  );
}

InputBorder defaultBorder({double? borderRadius}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius??30.0),
    borderSide: BorderSide(
      color: col89F1F5, // 启用时的边框颜色
      width: 1.0.w,
    ),
  );
}

LinearGradient defaultLinearGradient({Color? start,Color? end,}){
  return LinearGradient(
    begin: const Alignment(0.71, -0.71),
    end: const Alignment(-0.71, 0.71),
    colors: [start??colF7F7F7, end??col8E999A],
  );
}

/// returns Radius
BorderRadius radius([double? radius]) {
  return BorderRadius.all(radiusCircular(radius ?? defaultRadius));
}

/// returns Radius
Radius radiusCircular([double? radius]) {
  return Radius.circular(radius ?? defaultRadius);
}

ShapeBorder dialogShape([double? borderRadius]) {
  return RoundedRectangleBorder(
    borderRadius: radius(borderRadius ?? defaultRadius),
  );
}

/// returns custom Radius on each side
BorderRadius radiusOnly({
  double? topRight,
  double? topLeft,
  double? bottomRight,
  double? bottomLeft,
}) {
  return BorderRadius.only(
    topRight: radiusCircular(topRight ?? 0),
    topLeft: radiusCircular(topLeft ?? 0),
    bottomRight: radiusCircular(bottomRight ?? 0),
    bottomLeft: radiusCircular(bottomLeft ?? 0),
  );
}

/// default box decoration for container
Decoration boxDecorationDefault({
  BorderRadiusGeometry? borderRadius,
  Color? color,
  Gradient? gradient,
  BoxBorder? border,
  BoxShape? shape,
  BlendMode? backgroundBlendMode,
  List<BoxShadow>? boxShadow,
  DecorationImage? image,
}) {
  return BoxDecoration(
    borderRadius: (shape != null && shape == BoxShape.circle)
        ? null
        : (borderRadius ?? radius()),
    boxShadow: boxShadow ?? defaultBoxShadow(),
    color: color ?? Colors.white,
    gradient: gradient,
    border: border,
    shape: shape ?? BoxShape.rectangle,
    backgroundBlendMode: backgroundBlendMode,
    image: image,
  );
}

/// rounded box decoration
Decoration boxDecorationWithRoundedCorners({
  Color backgroundColor = colffffff,
  BorderRadius? borderRadius,
  LinearGradient? gradient,
  BoxBorder? border,
  List<BoxShadow>? boxShadow,
  DecorationImage? decorationImage,
  BoxShape boxShape = BoxShape.rectangle,
}) {
  return BoxDecoration(
    color: backgroundColor,
    borderRadius:
    boxShape == BoxShape.circle ? null : (borderRadius ?? radius()),
    gradient: gradient,
    border: border,
    boxShadow: boxShadow,
    image: decorationImage,
    shape: boxShape,
  );
}

/// box decoration with shadow
Decoration boxDecorationWithShadow({
  Color backgroundColor = colffffff,
  Color? shadowColor,
  double? blurRadius,
  double? spreadRadius,
  Offset offset = const Offset(0.0, 0.0),
  LinearGradient? gradient,
  BoxBorder? border,
  List<BoxShadow>? boxShadow,
  DecorationImage? decorationImage,
  BoxShape boxShape = BoxShape.rectangle,
  BorderRadius? borderRadius,
}) {
  return BoxDecoration(
    boxShadow: boxShadow ??
        defaultBoxShadow(
          shadowColor: shadowColor,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
          offset: offset,
        ),
    color: backgroundColor,
    gradient: gradient,
    border: border,
    image: decorationImage,
    shape: boxShape,
    borderRadius: borderRadius,
  );
}

/// rounded box decoration with shadow
Decoration boxDecorationRoundedWithShadow(int radiusAll, {
  Color backgroundColor = colffffff,
  Color? shadowColor,
  double? blurRadius,
  double? spreadRadius,
  Offset offset = const Offset(0.0, 0.0),
  LinearGradient? gradient,
}) {
  return BoxDecoration(
    boxShadow: defaultBoxShadow(
      shadowColor: shadowColor ?? shadowColorGlobal,
      blurRadius: blurRadius ?? defaultBlurRadius,
      spreadRadius: spreadRadius ?? defaultSpreadRadius,
      offset: offset,
    ),
    color: backgroundColor,
    gradient: gradient,
    borderRadius: radius(radiusAll.toDouble()),
  );
}

/// default box shadow
List<BoxShadow> defaultBoxShadow({
  Color? shadowColor,
  double? blurRadius,
  double? spreadRadius,
  Offset offset = const Offset(0.0, 0.0),
}) {
  return [
    BoxShadow(
      color: shadowColor ?? shadowColorGlobal,
      blurRadius: blurRadius ?? defaultBlurRadius,
      spreadRadius: spreadRadius ?? defaultSpreadRadius,
      offset: offset,
    )
  ];
}
