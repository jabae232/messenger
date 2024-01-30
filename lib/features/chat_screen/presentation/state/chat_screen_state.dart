part of 'chat_screen_bloc.dart';

abstract class ChatScreenState {}

class ChatScreenInitial extends ChatScreenState {}
class ChatScreenLoadedState extends ChatScreenState {}
class ChatScreenLoadingState extends ChatScreenState {}
class ChatScreenErrorState extends ChatScreenState {}
