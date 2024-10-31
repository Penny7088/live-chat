import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_chat/app/model/language_model.dart';
import 'package:live_chat/app/widget/language_view.dart';
import 'package:live_chat/base/config/normal_colors.dart';
import 'package:live_chat/base/utils/extensions/widget_extensions.dart';
import 'package:live_chat/base/utils/log_util.dart';
import 'package:live_chat/base/utils/text_styles.dart';

class LanguageItemView extends StatelessWidget {
  final Languages languages;
  final Function(Languages languages) callback;
  final bool? isNative;

  const LanguageItemView({super.key, required this.languages, required this.callback, this.isNative});

  @override
  Widget build(BuildContext context) {
    int level = languages.learnLevel ?? -1;
    bool isExpanded = level != -1;
    return StatefulBuilder(builder: (context, setState) {
      return Container(
          width: (1.sw - 70.w),
          margin: EdgeInsets.symmetric(horizontal: 35.w).copyWith(bottom: 10.h),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          child: isNative == true
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${languages.name}',
                      style: boldTextStyle(size: 16, color: level != -1 ? col1877F2 : col000000),
                    ),
                    Text(
                      '${languages.nativeName}',
                      style: secondaryTextStyle(size: 14, color: col979797),
                    ),
                  ],
                ).onTap(() {
                  callback.call(languages);
                })
              : ExpansionTile(
                  initiallyExpanded: isExpanded,
                  onExpansionChanged: (exp) {
                    logD('exp:$exp');
                    setState(() => isExpanded = exp);
                  },
                  title: Text(
                    '${languages.name}',
                    style: boldTextStyle(size: 16, color: level != -1 ? col1877F2 : col000000),
                  ),
                  subtitle: Text(
                    '${languages.nativeName}',
                    style: secondaryTextStyle(size: 14, color: col979797),
                  ),
                  children: [
                      LanguageView.started(
                        isChoose: level == 0,
                      ).onTap(() {
                        setState(() {
                          languages.learnLevel = 0;
                          isExpanded = false;
                        });
                        callback.call(languages);
                      }),
                      LanguageView.beginner(isChoose: level == 1).onTap(() {
                        setState(() {
                          languages.learnLevel = 1;
                          isExpanded = false;
                        });
                        callback.call(languages);
                      }),
                      LanguageView.intermediate(isChoose: level == 2).onTap(() {
                        setState(() {
                          languages.learnLevel = 2;
                          isExpanded = false;
                        });
                        callback.call(languages);
                      }),
                      LanguageView.advanced(isChoose: level == 3).onTap(() {
                        setState(() {
                          languages.learnLevel = 3;
                          isExpanded = false;
                        });
                        callback.call(languages);
                      }),
                      LanguageView.master(isChoose: level == 4).onTap(() {
                        setState(() {
                          languages.learnLevel = 4;
                          isExpanded = false;
                        });
                        callback.call(languages);
                      }),
                    ]));
    });
  }
}
