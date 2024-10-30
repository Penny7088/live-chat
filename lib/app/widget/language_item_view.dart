import 'package:flutter/material.dart';
import 'package:live_chat/app/model/language_model.dart';
import 'package:live_chat/app/widget/language_view.dart';
import 'package:live_chat/base/config/normal_colors.dart';
import 'package:live_chat/base/utils/extensions/widget_extensions.dart';
import 'package:live_chat/base/utils/text_styles.dart';

class LanguageItemView extends StatelessWidget {
  Languages languages;

  LanguageItemView({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return ExpansionTile(
        title: Text(
          '${languages.name}',
          style: boldTextStyle(size: 16, color: col000000),
        ),
        subtitle: Text(
          '${languages.nativeName}',
          style: secondaryTextStyle(size: 14, color: col979797),
        ),
        children: [
          LanguageView.started().onTap(() {}),
          LanguageView.beginner().onTap(() {}),
          LanguageView.intermediate().onTap(() {}),
          LanguageView.advanced().onTap(() {}),
          LanguageView.master().onTap((){}),
        ],
      );
    });
  }
}