part of 'chat_screen_bloc.dart';

abstract class ChatScreenEvent {}

class GetChatsEvent extends ChatScreenEvent{
  final String query;
  GetChatsEvent({required this.query});
}
class SearchForChatsEvent extends ChatScreenEvent{
  final String query;
  SearchForChatsEvent({required this.query});
}
