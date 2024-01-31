import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../dto/dto.dart';

class ChatScreenRepo {
  final SharedPreferences sharedPref;
  ChatScreenRepo({required this.sharedPref});
  Future<void> create() async {
    final List<Message> list = [
      Message(dateTime: '01:04', message: 'Здаров', sender: false),
      Message(dateTime: '01:15', message: 'Уже сделал?', sender: false),
      Message(dateTime: '3:15', message: 'Здаров, да?', sender: true),
    ];
    final chat = ChatDto(
      id: 0,
      name: 'Виктор',
      surname: 'Власов',
      messages: list,
      lastOnline: 'Вчера',
    );
    final chat1 = ChatDto(
      id: 1,
      name: 'Саша',
      surname: 'Алексеев',
      messages: list,
      lastOnline: 'Позавчера',
    );
    final chat2 = ChatDto(
      id: 2,
      name: 'Петр',
      surname: 'Жаринов',
      messages: list,
      lastOnline: 'Позавчера',
    );
    final chat3 = ChatDto(
      id: 3,
      name: 'Эрик',
      surname: 'Тян',
      messages: list,
      lastOnline: 'Позавчера',
    );
    final chat4 = ChatDto(
      id: 4,
      name: 'Алина',
      surname: 'Жукова',
      messages: list,
      lastOnline: 'Позавчера',
    );
    final List<ChatDto> chats = [chat, chat1, chat2, chat3, chat4];
    await sharedPref.setString('chats', json.encode(chats));
  }

  Future<List<ChatDto>> fetch(String? search) async {
    if(sharedPref.getString('chats') == null) {
      create();
    }
    // представим что я произвожу поиск через другой эндпоинт
    await Future.delayed(const Duration(seconds: 2));
    final List<ChatDto> list = [];
    late final List<ChatDto> chats;
    final response = sharedPref.getString('chats');
    if (response == null) {
      chats = [];
    } else {
      chats = chatDtoFromJson(response);
    }
    for (int i = 0; i <= chats.length - 1; i++) {
      if (chats[i].name.toLowerCase().contains(search ?? '') ||
          chats[i].surname.toLowerCase().contains(search ?? '')) {
        list.add(chats[i]);
      }
    }
    return list;
  }
  Future<List<Message>> sendMessage(int id,String dateTime,String message) async {
    // представим что я произвожу поиск через другой эндпоинт
    late final List<Message> list;
    late final List<ChatDto> chats;
    final response = sharedPref.getString('chats');
    if (response == null) {
      chats = [];
    } else {
      chats = chatDtoFromJson(response);
    }
    for (int i = 0; i <= chats.length - 1; i++) {
      if (chats[i].id == id) {
        chats[i].messages.add(Message(sender: true, dateTime: dateTime, message: message));
        list = chats[i].messages;
        await sharedPref.setString('chats', json.encode(chats));
        break;
      }
    }
    return list;
  }
}
