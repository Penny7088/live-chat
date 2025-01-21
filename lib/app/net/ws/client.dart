// ignore_for_file: unnecessary_getters_setters

import 'dart:async';

import 'package:live_chat/app/net/ws/websocket.dart';
import 'package:rxdart/rxdart.dart';
import 'package:synchronized/synchronized.dart';

import '../../../base/utils/log_util.dart';
import 'connection_status.dart';
import 'event/event.dart';
import 'event_type.dart';


class StreamChatClient {
  /// Create a client instance with default options.
  /// You should only create the client once and re-use it across your
  /// application.
  StreamChatClient(
    {
    required String baseUrl,
    required String token,
    required Map<String,dynamic> queryParameters,
  }) {
    logI('Initiating new StreamChatClient');

    _ws =
        WebSocket(
          baseUrl: baseUrl,
          handler: handleEvent,
          logger: detachedLogger(),
          token: token,
          queryParameters: queryParameters
        );

  }

  late final WebSocket _ws;


  /// Additional headers for all requests
  static Map<String, Object?> additionalHeaders = {};



  /// the last dateTime at the which all the channels were synced
  DateTime? _lastSyncedAt;




  StreamSubscription<ConnectionStatus>? _connectionStatusSubscription;

  final _eventController = BehaviorSubject<Event>();

  /// Stream of [Event] coming from [_ws] connection
  /// Listen to this or use the [on] method to filter specific event types
  Stream<Event> get eventStream => _eventController.stream;

  final _wsConnectionStatusController =
      BehaviorSubject.seeded(ConnectionStatus.disconnected);

  set _wsConnectionStatus(ConnectionStatus status) =>
      _wsConnectionStatusController.add(status);

  /// The current status value of the [_ws] connection
  ConnectionStatus get wsConnectionStatus =>
      _wsConnectionStatusController.value;

  /// This notifies the connection status of the [_ws] connection.
  /// Listen to this to get notified when the [_ws] tries to reconnect.
  Stream<ConnectionStatus> get wsConnectionStatusStream =>
      _wsConnectionStatusController.stream.distinct();


  /// Disconnects the [_ws] connection,
  /// without removing the user set on client.
  ///
  /// This will not trigger default auto-retry mechanism for reconnection.
  /// You need to call [openConnection] to reconnect to [_ws].
  void closeConnection() {
    if (wsConnectionStatus == ConnectionStatus.disconnected) return;

    _wsConnectionStatus = ConnectionStatus.disconnected;

    _connectionStatusSubscription?.cancel();
    _connectionStatusSubscription = null;

    _ws.disconnect();
  }

  void _handleHealthCheckEvent(Event event) {
    final user = event.user;

  }

  /// Method called to add a new event to the [_eventController].
  void handleEvent(Event event) {
    if (event.type == EventType.healthCheck) {
      return _handleHealthCheckEvent(event);
    }
    return _eventController.add(event);
  }


  /// Stream of [Event] coming from [_ws] connection
  /// Pass an eventType as parameter in order to filter just a type of event
  Stream<Event> on([
    String? eventType,
    String? eventType2,
    String? eventType3,
    String? eventType4,
  ]) {
    if (eventType == null) return eventStream;
    return eventStream.where((event) =>
        event.type == eventType ||
        event.type == eventType2 ||
        event.type == eventType3 ||
        event.type == eventType4);
  }

  // Lock to make sure only one sync process is running at a time.
  final _syncLock = Lock();



}


