import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_bot_v1/utils/colors.dart';
import 'package:my_bot_v1/utils/consts.dart';
import 'package:my_bot_v1/utils/strings.dart';
import 'package:my_bot_v1/view/chatgptscreen/chatgpt_screen.dart';
import 'package:my_bot_v1/view/dallEscreen/dalle_screen.dart';
import 'package:my_bot_v1/view/homescreen/application/home_notifier.dart';
import 'package:my_bot_v1/view/homescreen/application/togle_notify.dart';
import 'package:my_bot_v1/view/homescreen/widgets/togle_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isOnline = Provider.of<ToggleNotifier>(context).isOnline;
    var homeNotifer = Provider.of<HomeNotifier>(context);
    final textcontroller = TextEditingController();

    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Text.rich(TextSpan(
                      text: "My ",
                      style: heading(primaryTextColor),
                      children: [
                        TextSpan(text: "Bot", style: heading(primaryColor)),
                      ])),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: primaryTextColor,
                      ))
                ],
              ),
            ),
            ToggleBar(),
            kHeight18,
            Expanded(
                child: isOnline ? const ChatGptScreen() : const DallEScreen())
          ],
        ),
      ),
      // floatingActionButton: GestureDetector(
      //   onTap: () {},
      //   child: const CircleAvatar(
      //     child: Icon(Icons.mic),
      //   ),
      // ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            inputFormatters: [LengthLimitingTextInputFormatter(16)],
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
                        : homeNotifer.changepromt(textcontroller.text, context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: (homeNotifer.showsufficxIcon)
                        ? SvgPicture.asset("assets/svgs/enterbuttonaafter.svg")
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
    );
  }
}
