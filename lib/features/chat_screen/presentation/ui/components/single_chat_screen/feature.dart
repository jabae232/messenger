import 'package:flutter/material.dart';
import 'package:messanger/features/chat_screen/data/dto/dto.dart';
import 'package:messanger/features/chat_screen/presentation/ui/components/single_chat_screen/presentation/ui/single_chat_screen.dart';
import 'package:messanger/features/chat_screen/presentation/ui/components/single_chat_screen/presentation/viewmodel/single_chat_view_model.dart';
import 'package:provider/provider.dart';

class SingleChatScreenFeature extends StatelessWidget {
  const SingleChatScreenFeature({Key? key,required this.messages,required this.color}) : super(key: key);
  final ChatDto messages;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SingleChatScreenViewModel(),
      child: SingleChatScreen(messages: messages,color: color),
    );
  }
}