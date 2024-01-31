import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messanger/constants/app_colors.dart';
import 'package:messanger/constants/app_styles.dart';
import 'package:messanger/features/chat_screen/presentation/ui/components/single_chat_screen/feature.dart';

import '../../../data/dto/dto.dart';

class ChatCard extends StatelessWidget {
  const ChatCard(
      {Key? key,required this.chat,
        required this.color,
      })
      : super(key: key);
  final ChatDto chat;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => SingleChatScreenFeature(messages: chat,color: color,),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Text(
            '${chat.name.substring(0, 1)}${chat.surname.substring(0, 1)}',
            style: AppStyles.s16w500.copyWith(
              color: AppColors.background,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        title: Text(
          '${chat.name} ${chat.surname}',
          style: AppStyles.s15w600,
        ),
        subtitle: Text(
          'Уже сделал?',
          style: AppStyles.s12w500.copyWith(color: AppColors.darkGrey),
        ),
        trailing: Text(
          chat.messages.last.dateTime,
          style: AppStyles.s12w500.copyWith(color: AppColors.darkGrey),
        ),
      ),
    );
  }
}
