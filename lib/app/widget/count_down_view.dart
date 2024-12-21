import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../local/local_key.dart';

class CountdownWidget extends StatefulWidget {
  ///构造中传入函数
  final VoidCallback? onClick;

  final VoidCallback? onFinish;
  final int total;
  final double borderRadius;
  final String content;
  final double? height;
  final double? width;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final TextStyle? textStyle;

  const CountdownWidget(
      {this.total = 5,
      super.key,
      this.height = 40,
      this.width = 40,
      this.onClick,
      this.onFinish,
      this.borderRadius = 20,
      this.content = "",
      this.focusColor,
      this.hoverColor,
      this.textStyle,
      this.highlightColor});

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  var _count = 0;
  var _total = 0;

  Timer? _timer;
  var duration = const Duration(seconds: 1);

  ///注册倒计时
  @override
  void initState() {
    super.initState();
    _total = widget.total;
  }

  void startCountDown() {
    if(_count == 0){
      setState(() {
        _count = _total;
      });
    }

    _timer = Timer.periodic(duration, (timer) {
      setState(() {
        if (_count < 1) {
          _timer?.cancel();
          widget.onFinish?.call();
        } else {
          _count = _count - 1;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer?.isActive == true) {
      _timer?.cancel();
      _timer = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: widget.focusColor,
      hoverColor: widget.hoverColor,
      highlightColor: widget.highlightColor,
      onTap: () {
        if(_count > 0){
          return;
        }
        widget.onClick?.call();
        startCountDown();
      },
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Card(
          color: Colors.white,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Text(
                  _count > 0
                      ? '$_count ${LanguageKey.retrySendVerificationCode.tr}'
                      : LanguageKey.sendVerificationCode.tr,
                  style: widget.textStyle),
            ),
          ),
        ),
      ),
    );
  }
}
