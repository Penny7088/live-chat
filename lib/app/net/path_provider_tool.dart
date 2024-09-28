/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-10-20 15:54:51
 * @LastEditors: TT
 * @LastEditTime: 2023-10-20 15:54:51
 */
/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-09-13 11:12:33
 * @LastEditors: TT
 * @LastEditTime: 2023-10-12 08:50:32
 */

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class PathProviderTool {
  /// 获取temp 文件信息
  /// -iOS和macOS上的“NSCachesDirectory”。
  ///-Android上的`Context.getCacheDir`。
  static Future<Directory?> getTemp() async {
    if (!kIsWeb) {
      return await getTemporaryDirectory();
    } else {
      return null;
    }
  }

  static Future<Directory?> getDocument() async {
    if (!kIsWeb) {
      return await getApplicationDocumentsDirectory();
    } else {
      return null;
    }
  }

  /// 获取temp 路径
  static getTemPath() async {
    Directory? directory = await getTemp();
    return directory?.path ?? "";
  }

  static getDocumentPath() async {
    Directory? directory = await getDocument();
    return directory?.path ?? "";
  }
}
