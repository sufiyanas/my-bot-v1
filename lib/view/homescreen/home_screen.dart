import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_bot_v1/main.dart';
import 'package:my_bot_v1/utils/colors.dart';
import 'package:my_bot_v1/utils/consts.dart';
import 'package:my_bot_v1/utils/strings.dart';
import 'package:my_bot_v1/view/chatgptscreen/chatgpt_screen.dart';
import 'package:my_bot_v1/view/dallEscreen/dalle_screen.dart';
import 'package:my_bot_v1/view/homescreen/application/home_notifier.dart';
import 'package:my_bot_v1/view/homescreen/application/togle_notify.dart';
import 'package:my_bot_v1/view/homescreen/widgets/togle_bar.dart';
import 'package:my_bot_v1/view/profilescreen/profile_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isOnline = Provider.of<ToggleNotifier>(context).isOnline;
    var homeNotifer = Provider.of<HomeNotifier>(context);
    final textcontroller = TextEditingController();

    return Scaffold(
      backgroundColor: black,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Text.rich(TextSpan(
                          text: "My ",
                          style: heading(color: primaryTextColor),
                          children: [
                            TextSpan(
                                text: "Bot",
                                style: heading(color: primaryColor)),
                          ])),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const ProfileScreen(),
                                transitionDuration:
                                    const Duration(milliseconds: 100),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  return SlideTransition(
                                    position: Tween<Offset>(
                                            begin: const Offset(1.0, 0.0),
                                            end: const Offset(0.0, 0.0))
                                        .animate(animation),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.menu,
                            color: primaryTextColor,
                          ))
                    ],
                  ),
                ),
                ToggleBar(),
                kHeight18,
                isOnline ? const ChatGptScreen() : const DallEScreen(),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    inputFormatters: [LengthLimitingTextInputFormatter(100)],
                    // autofocus: true,
                    controller: textcontroller,
                    onChanged: (value) {
                      homeNotifer.updateSuffixIcon(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Employee ID";
                      } else if (value.contains(' ')) {
                        return "Spaces are not allowed";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        fillColor: inputFieldBackgrount,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: black)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: red)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: black)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: red)),
                        suffixIcon: GestureDetector(
                          onTap: () async {
                            (isOnline)
                                ? homeNotifer.addSenderList(textcontroller.text)
                                : homeNotifer.changepromt(
                                    textcontroller.text, context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: (homeNotifer.showsufficxIcon)
                                ? SvgPicture.asset(
                                    "assets/svgs/enterbuttonaafter.svg")
                                : SvgPicture.asset(
                                    "assets/svgs/enterButton.svg",
                                  ),
                          ),
                        ),
                        suffixIconConstraints: const BoxConstraints(
                          minHeight: 28,
                          minWidth: 28,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        hintText: "Type here....",
                        hintStyle: button(secondaryTextColor),
                        border: InputBorder.none),
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GestureDetector(
          onTap: () {
            showCupertinoDialog(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title: const Text('Alert'),
                  content: const Text('Do you want to delete the KEY'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    CupertinoDialogAction(
                      child: const Text('OK'),
                      onPressed: () {
                        // perform action on OK
                        Navigator.of(context).pop();
                        storage.deleteAll();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Text(
            "Delete API key",
            style: body1(
              secondaryTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
