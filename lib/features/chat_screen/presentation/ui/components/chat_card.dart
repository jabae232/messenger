import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messanger/constants/app_colors.dart';
import 'package:messanger/constants/app_styles.dart';
import 'package:messanger/features/chat_screen/presentation/ui/components/single_chat_screen/feature.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const SingleChatScreenFeature(),
          ),
      ),
      child: ListTile(
        leading: CircleAvatar(),
        title: const Text(
          'Виктор Смазной',
          style: AppStyles.s15w600,
        ),
        subtitle: Text(
          'Уже сделал?',
          style: AppStyles.s12w500.copyWith(color: AppColors.darkGrey),
        ),
        trailing: Text(
          'hello 19 302',
          style: AppStyles.s12w500.copyWith(color: AppColors.darkGrey),
        ),
      ),
    );
  }
}
