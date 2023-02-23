import 'package:flutter/material.dart';
import 'package:my_bot_v1/view/homescreen/home_screen.dart';

homepageRount(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
}
