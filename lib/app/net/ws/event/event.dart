import '../event_type.dart';

class Event {

  /// The connection id in which the event has been sent
  String? connectionId;

  /// The type of the event
  /// [EventType] contains some predefined constant types
  String? type;

  int? uid;

  Event.fromJson(dynamic json) {
    connectionId = json['connectionId'];
    type = json['type'];
    uid = json['uid'];
  }

  Event({this.connectionId, this.type,this.uid});
}
