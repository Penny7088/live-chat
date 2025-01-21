import 'package:live_chat/app/api/model/user_model.dart';

import '../event_type.dart';

class Event {

  /// The connection id in which the event has been sent
  String? connectionId;

  /// The type of the event
  /// [EventType] contains some predefined constant types
  String? type;

  int? uid;

  UserModel? user;

  bool? online;

  Event.fromJson(dynamic json) {
    connectionId = json['connectionId'];
    type = json['type'];
    user = json['user'];
    uid = json['uid'];
  }

  Event({this.connectionId, this.type,this.uid,this.online});
}
