import 'package:flutter_chat_for_job/models/Message.dart';

class Conversation {
  String id;
  String name;
  bool isOnline;
  List<Message> messages;

  Conversation({this.id, this.name, this.isOnline, this.messages});
}
