import 'package:flutter/material.dart';
import 'package:messanger/features/chat_screen/presentation/ui/chat_screen.dart';
import 'package:messanger/features/chat_screen/presentation/viewmodel/chat_screen_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreenFeature extends StatelessWidget {
  const LoginScreenFeature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatScreenViewModel(),
      child: const ChatScreen(),
    );
  }
}