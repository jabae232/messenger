part of 'single_chat_bloc.dart';

abstract class SingleChatEvent {}

class SendMessageEvent extends SingleChatEvent {
  final String message;
  final String dateTime;
  final int id;
  SendMessageEvent({
    required this.message,
    required this.id,
    required this.dateTime,
  });
}
