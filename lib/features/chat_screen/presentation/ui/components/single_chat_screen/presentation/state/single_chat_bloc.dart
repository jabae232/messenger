import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger/features/chat_screen/data/dto/dto.dart';
import 'package:messanger/features/chat_screen/data/repo/chat_screen_repo.dart';
part 'single_chat_event.dart';
part 'single_chat_state.dart';

class SingleChatBloc extends Bloc<SingleChatEvent, SingleChatState> {
  final ChatScreenRepo repo;
  SingleChatBloc({required this.repo}) : super(SingleChatInitial()) {
    on<SendMessageEvent>(_onSend);
  }
  void _onSend (SendMessageEvent event, Emitter<SingleChatState> emit) async {
    try{
      print('here');
      final sentMessage = await repo.sendMessage(event.id, event.dateTime, event.message);
      emit(SingleChatRefresh(messages: sentMessage));
    }
    catch(e){
      print(e);
    }
  }
}
