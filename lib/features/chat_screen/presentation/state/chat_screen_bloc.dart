import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/chat_screen_repo.dart';

part 'chat_screen_event.dart';
part 'chat_screen_state.dart';

class ChatScreenBloc extends Bloc<ChatScreenEvent, ChatScreenState> {
  final ChatScreenRepo repo;
  ChatScreenBloc({required this.repo}) : super(ChatScreenInitial()) {
    on<GetChatsEvent>(_onGetChats);
  }
  _onGetChats(GetChatsEvent event, Emitter<ChatScreenState> emit){
    emit(ChatScreenLoadingState());
    try{
      repo.fetch();
    }
    catch(e){

    }
  }
}
