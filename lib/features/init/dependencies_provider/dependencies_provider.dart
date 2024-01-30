import 'package:flutter/material.dart';
import 'package:messanger/features/init/dependencies_provider/providers/bloc_provider.dart';
import 'package:messanger/features/init/dependencies_provider/providers/repos_provider.dart';


class DependenciesProvider extends StatelessWidget {
  const DependenciesProvider({super.key, required this.builder});

  final Widget Function(BuildContext context) builder;

  @override
  Widget build(BuildContext context) {
    return ReposProvider(
      child: BlocsProvider(
        child: Builder(builder: builder),
      ),
    );
  }
}