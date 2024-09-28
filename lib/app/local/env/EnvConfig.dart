import 'package:live_chat/app/local/env/dotenv.dart';

/// 环境配置
class EnvConfig {
  static final EnvConfig _instance = EnvConfig._internal();

  factory EnvConfig() {
    return _instance;
  }

  EnvConfig._internal();

  bool get debugMode {
    String? debug = dotenv.env['DEBUG_MODE'];
    if (debug?.isEmpty == true) return true;
    if (debug == 'true') {
      return true;
    }
    return false;
  }

  String get releaseUrl {
    String? url = dotenv.env['RELEASE_BASE_URL'];
    if (url?.isEmpty == true) {
      return '';
    }
    return url!;
  }

  String get releaseWSUrl {
    String? url = dotenv.env['RELEASE_WEB_SOCKET_URL'];
    if (url?.isEmpty == true) {
      return '';
    }
    return url!;
  }

  String get devUrl {
    String? url = dotenv.env['DEV_BASE_URL'];
    if (url?.isEmpty == true) {
      return '';
    }
    return url!;
  }

  String get devWSUrl {
    String? url = dotenv.env['RELEASE_WEB_SOCKET_URL'];
    if (url?.isEmpty == true) {
      return '';
    }
    return url!;
  }

  init() async {
    await dotenv.load(fileName: 'assets/.env');
  }

  Future<String> obtainBaseUrl() async {
    bool isDebug = await debugMode;
    if (isDebug) {
      return devUrl;
    } else {
      return releaseUrl;
    }
  }

  Future<String> obtainWSBaseUrl() async {
    bool isDebug = await debugMode;
    if (isDebug) {
      return devWSUrl;
    } else {
      return releaseWSUrl;
    }
  }
}
