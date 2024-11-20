
import 'exception.dart';

class ApiResponse {
  late bool ok;
  dynamic data;
  String? msg;
  int? code;
  NetException? error;
  Map<String, dynamic>? response;

  ApiResponse.success({
    required dynamic netData,
    Map<String, dynamic>? response,
    String? reqMsg,
  }) {
    data = netData;
    msg = reqMsg;
    ok = true;
    if (response != null) {
      this.response = response;
    }
  }

  ApiResponse.fail({
    required this.data,
    String? errorMsg = '网络请求失败',
    int? errorCode = 404,
    Map<String, dynamic>? response,
  }) {
    msg = errorMsg;
    error = NetException(msg, errorCode);
    ok = false;
  }

  ApiResponse.failureFormResponse({dynamic data}) {
    error = BadResponseException();
    ok = false;
  }

  ApiResponse.failureFromError([NetException? requestError]) {
    error = requestError ?? UnKnownException();
    ok = false;
  }
}
