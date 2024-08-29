import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
enum AppButtonEnum {
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
  final String? iconUrl;
  final double? space;
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
    this.iconUrl,
    this.space,
    super.key,
    required this.appButtonEnum,
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
      child:
      MaterialButton(
        minWidth: widget.width,
        padding: widget.padding ?? dynamicAppButtonPadding(context),
        onPressed: widget.enabled
            ? widget.onTap != null
                ? widget.onTap as void Function()?
                : null
            : null,
        color: widget.color ?? appButtonBackgroundColorGlobal,
        shape: widget.shapeBorder ?? defaultAppButtonShapeBorder,
        elevation: widget.elevation ?? defaultAppButtonElevation,
        animationDuration: const Duration(milliseconds: 300),
        height: widget.height,
        disabledColor: widget.disabledColor,
        focusColor: widget.focusColor,
        hoverColor: widget.hoverColor,
        splashColor: widget.splashColor,
        disabledTextColor: widget.disabledTextColor,
        child: widget.child ??appButtonChild(),
      ),
    );
  }

  Widget appButtonChild() {
    Widget body;
    Widget? icon;
    if (widget.iconUrl?.isNotEmpty == true) {
      icon = SvgPicture.asset(
        widget.iconUrl ?? '',
        width: widget.iconSize?.width ?? 20.w,
        height: widget.iconSize?.height ?? 20.w,
      );
    }
    Widget text = Text(widget.text ?? '',style: widget.textStyle);

    switch (widget.appButtonEnum) {
      case AppButtonEnum.leftIcon:
        body = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon ?? const SizedBox(),
            (widget.space ?? 10).horizontalSpace,
            text
          ],
        );
        break;
      case AppButtonEnum.onlyText:
        body = text;
        break;
      case AppButtonEnum.onlyIcon:
        body = icon ?? const SizedBox();
        break;
      case AppButtonEnum.rightIcon:
        body = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            text,
            (widget.space ?? 10).horizontalSpace,
            icon ?? const SizedBox()
          ],
        );
        break;
      case AppButtonEnum.topIcon:
        body = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon ?? const SizedBox(),
            (widget.space ?? 10).horizontalSpace,
            text
          ],
        );
        break;
      case AppButtonEnum.bottomIcon:
        body = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            text,
            (widget.space ?? 10).horizontalSpace,
            icon ?? const SizedBox(),
          ],
        );
        break;
    }

    return body;
  }
}
