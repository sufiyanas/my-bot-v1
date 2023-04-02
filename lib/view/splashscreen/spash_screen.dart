import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_bot_v1/utils/colors.dart';
import 'package:my_bot_v1/view/apiscreen/api_screen.dart';
import 'package:my_bot_v1/view/homescreen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotonextscreen();

    // TODO: implement initState
    super.initState();
  }

  Future<void> gotonextscreen() async {
    await Future.delayed(Duration(seconds: 3)); // add await here
    final token =
        await FlutterSecureStorage().read(key: "token"); // await for the token
    if (token != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ApiScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Center(
        child: Image.asset("assets/images/spash_logo.png"),
      ),
    );
  }
}
