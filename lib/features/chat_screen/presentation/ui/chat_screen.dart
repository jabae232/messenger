import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:messanger/constants/app_styles.dart';
import 'package:messanger/features/chat_screen/presentation/viewmodel/chat_screen_view_model.dart';
import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import '../../../widgets/divider.dart';
import '../state/chat_screen_bloc.dart';
import 'components/chat_card.dart';
import 'components/text_field_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ChatScreenViewModel>();
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Чаты',
          style: AppStyles.s32w600,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            TextFieldWidget(
              isSearch: true,
              controller: vm.searchController,
              onChanged: (String query) {
                context.read<ChatScreenBloc>().add(
                      SearchForChatsEvent(query: vm.searchController.text),
                    );
              },
              hintText: 'Поиск',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(9.0),
                child: SvgPicture.asset(
                  AppAssets.svg.search,
                  color: AppColors.textFieldForeground,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: BlocConsumer<ChatScreenBloc, ChatScreenState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is ChatScreenLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is ChatScreenLoadedState) {
                    return state.chats.isNotEmpty
                        ? ListView.separated(
                            itemBuilder: (context, index) {
                              return ChatCard(
                                chat: state.chats[index],
                                color: vm.colors[index % 4],
                              );
                            },
                            itemCount: state.chats.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const DividerWidget();
                            },
                          )
                        : Center(
                            child: Text(
                              'Пусто',
                              style: AppStyles.s16w500
                                  .copyWith(color: AppColors.darkGrey),
                            ),
                          );
                  }
                  if (state is ChatScreenErrorState) {
                    return const Text('Что то пошло не так');
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
