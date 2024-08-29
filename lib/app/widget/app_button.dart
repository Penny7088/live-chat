import 'package:flutter/material.dart';
import 'package:live_chat/app/extensions/bool_extensions.dart';
import 'package:live_chat/app/extensions/string_extensions.dart';

import '../utils/text_styles.dart';
import 'widget_util.dart';

bool enableAppButtonScaleAnimationGlobal = true;
int? appButtonScaleAnimationDurationGlobal;
Color appBarBackgroundColorGlobal = Colors.white;
Color appButtonBackgroundColorGlobal = Colors.white;
Color defaultAppButtonTextColorGlobal = textPrimaryColorGlobal;
double defaultAppButtonRadius = 8.0;
double defaultAppButtonElevation = 4.0;
ShapeBorder? defaultAppButtonShapeBorder;

///[onlyText] single text
///[onlyIcon] single icon
///[rightIcon] right icon and left text [icon  text]
///[leftIcon] left icon and right text [text  icon]
///[topIcon] top icon and bottom text
///[bottomIcon] bottom text and top icon
enum AppButtonEnum{
  onlyText,
  onlyIcon,
  rightIcon,
  leftIcon,
  topIcon,
  bottomIcon,
}

class AppButton extends StatefulWidget {
  final Function? onTap;
  final String? text;
  final double? width;
  final Color? color;
  final Color? textColor;
  final Color? disabledColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? splashColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextStyle? textStyle;
  final ShapeBorder? shapeBorder;
  final Widget? child;
  final double? elevation;
  final double? height;
  final bool enabled;
  final bool? enableScaleAnimation;
  final Color? disabledTextColor;
  final Size? iconSize;
  final AppButtonEnum appButtonEnum;

  AppButton({
    this.onTap,
    this.text,
    this.width,
    this.color,
    this.textColor,
    this.padding,
    this.margin,
    this.textStyle,
    this.shapeBorder,
    this.child,
    this.elevation,
    this.enabled = true,
    this.height,
    this.disabledColor,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.enableScaleAnimation,
    this.disabledTextColor,
    this.iconSize,
    super.key, required this.appButtonEnum,
  });

  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  AnimationController? _controller;

  @override
  void initState() {
    if (widget.enableScaleAnimation
        .validate(value: enableAppButtonScaleAnimationGlobal)) {
      _controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: appButtonScaleAnimationDurationGlobal ?? 50,
        ),
        lowerBound: 0.0,
        upperBound: 0.1,
      )..addListener(() {
          setState(() {});
        });
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller != null && widget.enabled) {
      _scale = 1 - _controller!.value;
    }

    if (widget.enableScaleAnimation
        .validate(value: enableAppButtonScaleAnimationGlobal)) {
      return Listener(
        onPointerDown: (details) {
          _controller?.forward();
        },
        onPointerUp: (details) {
          _controller?.reverse();
        },
        child: Transform.scale(
          scale: _scale,
          child: buildButton(),
        ),
      );
    } else {
      return buildButton();
    }
  }

  Widget buildButton() {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: MaterialButton(
        minWidth: widget.width,
        padding: widget.padding ?? dynamicAppButtonPadding(context),
        onPressed: widget.enabled
            ? widget.onTap != null
                ? widget.onTap as void Function()?
                : null
            : null,
        color: widget.color ?? appButtonBackgroundColorGlobal,
        /// 这块需要抽出来
        child: widget.child ??
            Text(
              widget.text.validate(),
              style: widget.textStyle ??
                  boldTextStyle(
                    color: widget.textColor ?? defaultAppButtonTextColorGlobal,
                  ),
            ),
        shape: widget.shapeBorder ?? defaultAppButtonShapeBorder,
        elevation: widget.elevation ?? defaultAppButtonElevation,
        animationDuration: Duration(milliseconds: 300),
        height: widget.height,
        disabledColor: widget.disabledColor,
        focusColor: widget.focusColor,
        hoverColor: widget.hoverColor,
        splashColor: widget.splashColor,
        disabledTextColor: widget.disabledTextColor,
      ),
    );
  }

  Widget appButtonChild(){

    switch(widget.appButtonEnum){
      case AppButtonEnum.leftIcon:
        break;
      case AppButtonEnum.onlyText:
        break;
      case  AppButtonEnum.onlyIcon:
        break;
      case  AppButtonEnum.rightIcon:
        break;
      case  AppButtonEnum.topIcon:
        break;
      case  AppButtonEnum.bottomIcon:
        break;
    }

    return Container();
  }



}
