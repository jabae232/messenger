import 'package:flutter/material.dart';

import '../../../../../../data/dto/dto.dart';

class SingleChatScreenViewModel extends ChangeNotifier {
  bool _canSend = false;

  List<Message>? _messages;

  List<Message> get messages => _messages ?? [];


  final _controller = TextEditingController();

  void changeBtn() {
    if (_controller.text.isNotEmpty) {
      canSend = true;
    }else {
      canSend = false;
    }
  }

  bool get canSend => _canSend;

  set canSend(bool value) {
    _canSend = value;
    notifyListeners();
  }


  set messages(List<Message> value) {
    _messages = value;
    notifyListeners();
  }

  get controller => _controller;

}
