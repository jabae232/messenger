// To parse this JSON data, do
//
//     final chatDto = chatDtoFromJson(jsonString);

import 'dart:convert';

List<ChatDto> chatDtoFromJson(String str) => List<ChatDto>.from(json.decode(str).map((x) => ChatDto.fromJson(x)));

String chatDtoToJson(List<ChatDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatDto {
  final int id;
  final String name;
  final String surname;
  final List<Message> messages;
  final String lastOnline;

  ChatDto({
    required this.id,
    required this.name,
    required this.surname,
    required this.messages,
    required this.lastOnline,
  });

  factory ChatDto.fromJson(Map<String, dynamic> json) => ChatDto(
    id: json["id"],
    name: json["name"],
    surname: json["surname"],
    messages: List<Message>.from(json["messages"].map((x) => Message.fromJson(x))),
    lastOnline: json["lastOnline"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "surname": surname,
    "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
    "lastOnline": lastOnline,
  };
}

class Message {
  final bool sender;
  final String dateTime;
  final String message;

  Message({
    required this.sender,
    required this.dateTime,
    required this.message,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    sender: json["sender"],
    dateTime: json["dateTime"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "sender": sender,
    "dateTime": dateTime,
    "message": message,
  };
}
