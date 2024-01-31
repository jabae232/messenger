part of 'chat_screen_bloc.dart';

abstract class ChatScreenState {}

class ChatScreenInitial extends ChatScreenState {}
class ChatScreenLoadedState extends ChatScreenState {
  final List<ChatDto> chats;
  ChatScreenLoadedState({
    required this.chats
});
}
class ChatScreenLoadingState extends ChatScreenState {}
class ChatScreenErrorState extends ChatScreenState {}
