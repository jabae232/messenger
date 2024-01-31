import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger/features/chat_screen/data/dto/dto.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../data/repo/chat_screen_repo.dart';

part 'chat_screen_event.dart';
part 'chat_screen_state.dart';

EventTransformer<E> debounceSequential<E>(Duration duration) {
  return (events, mapper) {
    return sequential<E>().call(events.debounce(duration), mapper);
  };
}

class ChatScreenBloc extends Bloc<ChatScreenEvent, ChatScreenState> {
  final ChatScreenRepo repo;
  ChatScreenBloc({required this.repo}) : super(ChatScreenInitial()) {
    on<GetChatsEvent>(_onGetChats);
    on<SearchForChatsEvent>(
      _onSearchForChats,
      transformer: debounceSequential(
        const Duration(milliseconds: 1000),
      ),
    );
  }
  _onGetChats(GetChatsEvent event, Emitter<ChatScreenState> emit) async {
    emit(ChatScreenLoadingState());
    try {
      final chats = await repo.fetch(event.query);
      emit(ChatScreenLoadedState(chats: chats));
    } catch (e) {
      emit(ChatScreenErrorState());
    }
  }

  _onSearchForChats(
      SearchForChatsEvent event, Emitter<ChatScreenState> emit) async {
    emit(ChatScreenLoadingState());
    try {
      final chats = await repo.fetch(event.query);
      emit(ChatScreenLoadedState(chats: chats));
    } catch (e) {
      emit(ChatScreenErrorState());
    }
  }
}
