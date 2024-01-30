import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger/constants/app_styles.dart';
import '../../../../constants/app_colors.dart';
import '../../../widgets/divider.dart';
import '../state/chat_screen_bloc.dart';
import 'components/chat_card.dart';
import 'components/search_field.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: const Text('Чаты', style: AppStyles.s32w600,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: BlocConsumer<ChatScreenBloc, ChatScreenState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            return Column(
              children: [
                SearchField(),
                const SizedBox(height: 24),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => context.read<ChatScreenBloc>().add(GetChatsEvent()),
                          child: ChatCard());
                    },
                    itemCount: 20,
                    separatorBuilder: (BuildContext context, int index) {
                      return const DividerWidget();
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
