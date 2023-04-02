import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_bot_v1/view/apiscreen/api_screen.dart';
import 'package:my_bot_v1/view/homescreen/application/home_notifier.dart';
import 'package:my_bot_v1/view/homescreen/application/togle_notify.dart';
import 'package:my_bot_v1/view/homescreen/home_screen.dart';
import 'package:my_bot_v1/view/splashscreen/spash_screen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

final storage = const FlutterSecureStorage();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ToggleNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeNotifier(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => AuthProvider(),
        // ), // add the AuthProvider here
      ],
      child: MaterialApp(home: SplashScreen()),
    );
  }
}
