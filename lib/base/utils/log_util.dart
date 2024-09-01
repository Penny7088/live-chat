import 'package:logger/logger.dart';

const String _tag = "live_chat";

var _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
  ),
);

logV(String msg) {
  _logger.v("$_tag :: $msg");
}

logD(String msg) {
  _logger.d("$_tag :: $msg");
}

logI(String msg) {
  _logger.i("$_tag :: $msg");
}

logW(String msg) {
  _logger.w("$_tag :: $msg");
}

logE(String msg) {
  _logger.e("$_tag :: $msg");
}

logF(String msg) {
  _logger.f("$_tag :: $msg");
}