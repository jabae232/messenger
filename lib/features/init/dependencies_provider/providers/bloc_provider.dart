import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger/features/chat_screen/data/repo/chat_screen_repo.dart';
import 'package:messanger/features/chat_screen/presentation/state/chat_screen_bloc.dart';

class BlocsProvider extends StatelessWidget {
  const BlocsProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChatScreenBloc(
            repo: RepositoryProvider.of<ChatScreenRepo>(context),
          ),
        ),
      ],
      child: child,
    );
  }
}