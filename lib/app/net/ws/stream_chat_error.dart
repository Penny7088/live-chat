import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:live_chat/app/net/http_response.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'error/chat_error_code.dart';

///
class StreamChatError with EquatableMixin implements Exception {
  ///
  const StreamChatError(this.message);

  /// Error message
  final String message;

  @override
  List<Object?> get props => [message];

  @override
  String toString() => 'StreamChatError(message: $message)';
}

///
class StreamWebSocketError extends StreamChatError {
  ///
  const StreamWebSocketError(
    super.message, {
    this.data,
  });

  ///
  factory StreamWebSocketError.fromStreamError(Map<String, Object?> error) {
    final data = ApiResponse.fromJson(error);
    final message = data.msg ?? '';
    return StreamWebSocketError(message, data: data);
  }

  ///
  factory StreamWebSocketError.fromWebSocketChannelError(
    WebSocketChannelException error,
  ) {
    final message = error.message ?? '';
    return StreamWebSocketError(message);
  }

  ///
  int? get code => data?.code;

  ///
  ChatErrorCode? get errorCode {
    final code = this.code;
    if (code == null) return null;
    return chatErrorCodeFromCode(code);
  }

  /// Response body. please refer to [ErrorResponse].
  final ApiResponse? data;

  ///
  bool get isRetriable => data == null;

  @override
  List<Object?> get props => [...super.props, code];

  @override
  String toString() {
    var params = 'message: $message';
    if (data != null) params += ', data: $data';
    return 'WebSocketError($params)';
  }
}

///
class StreamChatNetworkError extends StreamChatError {
  ///
  StreamChatNetworkError(
    ChatErrorCode errorCode, {
    int? statusCode,
    this.data,
    this.isRequestCancelledError = false,
  })  : code = errorCode.code,
        statusCode = statusCode ?? data?.code,
        super(errorCode.message);

  ///
  StreamChatNetworkError.raw({
    required this.code,
    required String message,
    this.statusCode,
    this.data,
    this.isRequestCancelledError = false,
  }) : super(message);

  ///
  factory StreamChatNetworkError.fromDioException(DioException exception) {
    final response = exception.response;
    ApiResponse? errorResponse;
    final data = response?.data;
    if (data is Map<String, Object?>) {
      errorResponse = ApiResponse.fromJson(data);
    } else if (data is String) {
      errorResponse = ApiResponse.fromJson(jsonDecode(data));
    }
    return StreamChatNetworkError.raw(
      code: errorResponse?.code ?? -1,
      message: errorResponse?.msg ??
          response?.statusMessage ??
          exception.message ??
          '',
      statusCode: errorResponse?.code ?? response?.statusCode,
      data: errorResponse,
      isRequestCancelledError: exception.type == DioExceptionType.cancel,
    )..stackTrace = exception.stackTrace;
  }

  /// Error code
  final int code;

  /// HTTP status code
  final int? statusCode;

  /// Response body. please refer to [ErrorResponse].
  final ApiResponse? data;

  /// True, in case the error is due to a cancelled network request.
  final bool isRequestCancelledError;

  StackTrace? _stackTrace;

  ///
  set stackTrace(StackTrace? stack) => _stackTrace = stack;

  ///
  ChatErrorCode? get errorCode => chatErrorCodeFromCode(code);

  ///
  bool get isRetriable => data == null;

  @override
  List<Object?> get props => [...super.props, code, statusCode];

  @override
  String toString({bool printStackTrace = false}) {
    var params = 'code: $code, message: $message';
    if (statusCode != null) params += ', statusCode: $statusCode';
    if (data != null) params += ', data: $data';
    var msg = 'StreamChatNetworkError($params)';

    if (printStackTrace && _stackTrace != null) {
      msg += '\n$_stackTrace';
    }
    return msg;
  }
}
