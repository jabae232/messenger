import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../dto/dto.dart';

class ChatScreenRepo {
  final SharedPreferences sharedPref;
  ChatScreenRepo({required this.sharedPref});
  Future<void> create() async {
    final List<Message> list = [
      Message(
          dateTime: DateTime(2022, 1, 11).toString(),
          message: 'Здаров',
          sender: false),
      Message(
          dateTime: DateTime(2022, 1, 11).toString(),
          message: 'Уже сделал?',
          sender: false),
    ];

    final List<Message> list1 = [
      Message(
          dateTime: DateTime(2024, 2, 1, 10, 0).toString(),
          message: 'Здаров',
          sender: false),
      Message(
          dateTime: DateTime(2024, 2, 1, 11, 0).toString(),
          message: 'Уже сделал?',
          sender: false),
      Message(
          dateTime: DateTime(2024, 2, 1, 12, 0).toString(),
          message: 'Здаров, да?',
          sender: true),
    ];
    final List<Message> list2 = [
      Message(
          dateTime: DateTime.now().toString(),
          message: 'Здаров',
          sender: false),
      Message(
          dateTime: DateTime.now().toString(),
          message: 'Уже сделал?',
          sender: false),
      Message(
          dateTime: DateTime.now().toString(),
          message: 'Здаров, да?',
          sender: true),
    ];
    final List<Message> list3 = [
      Message(
          dateTime: DateTime(2024, 1, 12, 12, 0).toString(),
          message: 'Здаров',
          sender: false),
      Message(
          dateTime: DateTime(2024, 1, 12, 12, 0).toString(),
          message: 'Уже сделал?',
          sender: false),
      Message(
          dateTime: DateTime(2024, 1, 31, 12, 0).toString(),
          message: 'Здаров, да?',
          sender: true),
    ];
    final List<ChatDto> chats = [
      ChatDto(
        id: 0,
        name: 'Виктор',
        surname: 'Власов',
        messages: list,
        lastOnline: 'Вчера',
      ),
      ChatDto(
        id: 1,
        name: 'Саша',
        surname: 'Алексеев',
        messages: list1,
        lastOnline: 'Позавчера',
      ),
      ChatDto(
        id: 2,
        name: 'Петр',
        surname: 'Жаринов',
        messages: list2,
        lastOnline: 'Вчера',
      ),
      ChatDto(
        id: 3,
        name: 'Эрик',
        surname: 'Тян',
        messages: list3,
        lastOnline: 'Месяц назад',
      ),
      ChatDto(
        id: 4,
        name: 'Алина',
        surname: 'Жукова',
        messages: list,
        lastOnline: 'Позавчера',
      ),
      ChatDto(
        id: 5,
        name: 'Карина',
        surname: 'Власова',
        messages: list2,
        lastOnline: 'Позавчера',
      ),
      ChatDto(
        id: 6,
        name: 'Алибек',
        surname: 'Алибай',
        messages: list3,
        lastOnline: '5 дней назад',
      ),
    ];
    await sharedPref.setString('chats', json.encode(chats));
  }

  Future<List<ChatDto>> fetch(String? search) async {
    if (sharedPref.getString('chats') == null) {
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
    print(DateTime(2022, 1, 12));
    for (int i = 0; i <= chats.length - 1; i++) {
      if (chats[i].name.toLowerCase().contains(search ?? '') ||
          chats[i].surname.toLowerCase().contains(search ?? '')) {
        list.add(chats[i]);
      }
    }
    return list;
  }

  Future<List<Message>> sendMessage(
      int id, String dateTime, String message) async {
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
        chats[i]
            .messages
            .add(Message(sender: true, dateTime: dateTime, message: message));
        list = chats[i].messages;
        await sharedPref.setString('chats', json.encode(chats));
        break;
      }
    }
    return list;
  }
}
