import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:messanger/features/chat_screen/feature.dart';
import 'application/utils.dart';
import 'features/init/dependencies_provider/dependencies_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  runApp(
    DependenciesProvider(
      builder: (BuildContext context) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: ChatScreenFeature(),
        );
      },
    ),
  );
}

