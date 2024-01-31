part of 'single_chat_bloc.dart';

abstract class SingleChatState {}

class SingleChatInitial extends SingleChatState {}

class SingleChatRefresh extends SingleChatState {
  final List<Message> messages;
  SingleChatRefresh({required this.messages});
}
