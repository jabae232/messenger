import 'package:flutter/material.dart';
import 'package:messanger/features/chat_screen/data/repo/chat_screen_repo.dart';
import 'package:provider/provider.dart';

class ReposProvider extends StatelessWidget {
  const ReposProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /*Provider(
            create: (context) => RepoSearch(
              api: RepositoryProvider.of<Api>(context),
            )),*/
        Provider(create: (context) => ChatScreenRepo()),
      ],
      child: child,
    );
  }
}
