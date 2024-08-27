import 'package:get/get.dart';

import 'tr/_ar.dart';
import 'tr/_de.dart';
import 'tr/_en.dart';
import 'tr/_hans.dart';
import 'tr/_hant.dart';
import 'tr/_it.dart';
import 'tr/_ja.dart';
import 'tr/_ko.dart';
import 'tr/_fr.dart';
import 'tr/_pt.dart';
import 'tr/_ru.dart';
import 'tr/_uk.dart';

class I18TRMessages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh': hans,
        'zh_CN': hans,
        'zh_HK': hant,
        'zh_MO': hant,
        'zh_TW': hant,
        'en': en,
        'en_GB': en, // 英语_英国
        'en_US': en, // 英语_美国
        'en_CA': en, // 英语_加拿大
        'en_AU': en, // 英语_澳大利亚
        'en_IN': en, // 英语_印度
        'ko': ko,
        'ko_KR': ko,
        'ja': ja,
        'ja_JP': ja,
        'fr': fr,
        'fr_FR': fr, // 法语_法国
        'fr_CA': fr, // 法语_加拿大
        'de': de,
        'de_DE': de, // 德语_德国
        'ru': ru,
        'ru_RU': ru, //  俄语_俄罗斯
        'uk': uk, // 乌克兰语
        'ar': ar,
        'ar_SA': ar,
        'ar_EG': ar,
        'ar_KW': ar,
        'it': it,
        'it_IT': it, // 意大利语_意大利
        'it_CH': it, // 意大利语_瑞士
        'pt': pt,
        'pt_PT': pt, // 葡萄牙语_葡萄牙
        'pt_BR': pt, // 葡萄牙语_巴西
      };
}
