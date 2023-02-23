import 'package:flutter/material.dart';
import 'package:my_bot_v1/view/apiscreen/api_screen.dart';
import 'package:my_bot_v1/view/homescreen/application/home_notifier.dart';
import 'package:my_bot_v1/view/homescreen/application/togle_notify.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ToggleNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeNotifier(),
        )
      ],
      child: MaterialApp(
        home: ApiScreen(),
      ),
    );
  }
}
