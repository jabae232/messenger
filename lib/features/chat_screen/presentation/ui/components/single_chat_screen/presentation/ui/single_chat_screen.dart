import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:messanger/constants/app_assets.dart';
import 'package:messanger/constants/app_styles.dart';
import 'package:messanger/features/chat_screen/data/dto/dto.dart';
import 'package:messanger/features/chat_screen/presentation/state/chat_screen_bloc.dart';
import 'package:messanger/features/chat_screen/presentation/ui/components/single_chat_screen/presentation/ui/components/pressable_btn.dart';
import 'package:messanger/features/chat_screen/presentation/ui/components/single_chat_screen/presentation/viewmodel/single_chat_view_model.dart';
import '../../../../../../../../constants/app_colors.dart';
import '../../../text_field_widget.dart';
import '../state/single_chat_bloc.dart';
import 'components/chat_bubble.dart';

class SingleChatScreen extends StatelessWidget {
  const SingleChatScreen({
    Key? key,
    required this.messages,
    required this.color,
  }) : super(key: key);
  final ChatDto messages;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<SingleChatScreenViewModel>();
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.chevron_left,
                  color: AppColors.defaultBlack,
                  size: 24,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: CircleAvatar(
                  backgroundColor: color,
                  child: Text(
                    '${messages.name.substring(0, 1)}${messages.surname.substring(0, 1)}',
                    style: AppStyles.s16w500.copyWith(
                      color: AppColors.background,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${messages.name} ${messages.surname}',
                    style: AppStyles.s15w600,
                  ),
                  Text(
                    messages.lastOnline != 'Онлайн'
                        ? 'Был в сети: ${messages.lastOnline}'
                        : messages.lastOnline,
                    style:
                        AppStyles.s12w500.copyWith(color: AppColors.darkGrey),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocListener<SingleChatBloc, SingleChatState>(
              listener: (context, state) {
                if (state is SingleChatRefresh) {
                  vm.messages = state.messages;
                }
              },
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final message = vm.messages.isEmpty
                      ? messages.messages[messages.messages.length - index - 1]
                      : vm.messages[vm.messages.length - index - 1];
                  return BubbleSpecialThree(
                    dateTime: message.dateTime,
                    isSender: message.sender,
                    seen: message.sender ? true : false,
                    delivered: message.sender ? true : false,
                    text: message.message,
                    color: message.sender
                        ? AppColors.messageBackgroundSender
                        : AppColors.messageBackgroundReceiver,
                    tail: true,
                    textStyle: AppStyles.s12w500.copyWith(fontSize: 14),
                  );
                },
                itemCount: vm.messages.isEmpty
                    ? messages.messages.length
                    : vm.messages.length,
                reverse: true,
              ),
            ),
          ),
          const Divider(
            color: AppColors.textFieldBackground,
            height: 0.3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 23),
            child: Row(
              children: [
                PressableBtn(
                    icon: SvgPicture.asset(AppAssets.svg.attachment),
                    onTap: () {}),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFieldWidget(
                    controller: vm.controller,
                    onChanged: (String value) {
                      vm.changeBtn();
                    },
                    hintText: 'Сообщение',
                  ),
                )),
                vm.canSend
                    ? PressableBtn(
                        icon: const Icon(Icons.send_rounded),
                        onTap: () {
                          context.read<SingleChatBloc>().add(
                                SendMessageEvent(
                                  message: vm.controller.text,
                                  id: messages.id,
                                  dateTime: DateFormat('HH:mm').format(
                                    DateTime.now(),
                                  ),
                                ),
                              );
                          context.read<ChatScreenBloc>().add(
                                GetChatsEvent(query: ''),
                              );
                          vm.controller.text = '';
                        })
                    : PressableBtn(
                        icon: SvgPicture.asset(AppAssets.svg.audio),
                        onTap: () {})
              ],
            ),
          )
        ],
      ),
    );
  }
}
