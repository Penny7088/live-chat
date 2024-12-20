import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_chat/app/page/common/country_page/country_page/country_page_view.dart';

import '../config/normal_colors.dart';

/// Text Styles
Color textPrimaryColorGlobal = col000000;
Color textSecondaryColorGlobal = col000000;
FontWeight fontWeightBoldGlobal = FontWeight.bold;
FontWeight fontWeightPrimaryGlobal = FontWeight.normal;
FontWeight fontWeightSecondaryGlobal = FontWeight.normal;
String? fontFamilyBoldGlobal = 'Dream';
double textBoldSizeGlobal = 16;
double textPrimarySizeGlobal = 16;
double textSecondarySizeGlobal = 14;
String? fontFamilyPrimaryGlobal = 'editor';
String? fontFamilySecondaryGlobal;

/// Returns a TextStyle with bold weight.
TextStyle boldTextStyle({
  int? size,
  Color? color,
  FontWeight? weight,
  String? fontFamily,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
  double? height,
}) {
  return TextStyle(
      fontSize: size != null ? size.toDouble() : textBoldSizeGlobal,
      color: color ?? textPrimaryColorGlobal,
      fontWeight: weight ?? fontWeightBoldGlobal,
      fontFamily: fontFamily ?? fontFamilyBoldGlobal,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,
      decoration: decoration ?? TextDecoration.none,
      decorationStyle: textDecorationStyle,
      decorationColor: decorationColor,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      backgroundColor: backgroundColor,
      height: height,
      inherit: true);
}

/// Returns a TextStyle with primary color and default settings.
TextStyle primaryTextStyle({
  double? size,
  Color? color,
  FontWeight? weight,
  String? fontFamily,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
  double? height,
}) {
  return TextStyle(
      fontSize: size != null ? size.sp : textPrimarySizeGlobal,
      color: color ?? textPrimaryColorGlobal,
      fontWeight: weight ?? fontWeightPrimaryGlobal,
      fontFamily: fontFamily ?? fontFamilyPrimaryGlobal,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,
      decoration: decoration ?? TextDecoration.none,
      decorationStyle: textDecorationStyle,
      decorationColor: decorationColor,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      backgroundColor: backgroundColor,
      height: height,
      inherit: true);
}

/// Returns a TextStyle with secondary color and default settings.
TextStyle secondaryTextStyle({
  int? size,
  Color? color,
  FontWeight? weight,
  String? fontFamily,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
  double? height,
}) {
  return TextStyle(
    fontSize: size != null ? size.toDouble() : textSecondarySizeGlobal,
    color: color ?? textSecondaryColorGlobal,
    fontWeight: weight ?? fontWeightSecondaryGlobal,
    fontFamily: fontFamily ?? fontFamilySecondaryGlobal,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration?? TextDecoration.none,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    backgroundColor: backgroundColor,
    height: height,
  );
}

