import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_bot_v1/utils/colors.dart';
import 'package:my_bot_v1/utils/consts.dart';
import 'package:my_bot_v1/utils/rounts.dart';
import 'package:my_bot_v1/utils/strings.dart';

class ApiScreen extends StatefulWidget {
  ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  final node = FocusNode();
  final keyControlller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    final mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: mheight * 0.30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text.rich(TextSpan(
                      text: "Enter your ",
                      style: body1(primaryTextColor),
                      children: [
                        TextSpan(text: "open.ai ", style: body1(primaryColor)),
                        TextSpan(
                            text: "api key in the below field",
                            style: body1(primaryTextColor)),
                      ])),
                ),
                kHeight07,
                Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: TextFormField(
                      inputFormatters: [LengthLimitingTextInputFormatter(16)],
                      // autofocus: true,
                      controller: keyControlller,
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
                          // hintText: 'Enter API key',
                          hintText: "Enter API key",
                          hintStyle: button(secondaryTextColor),
                          border: InputBorder.none),
                    )),
                kHeight08,
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: MaterialButton(
                    onPressed: () {
                      final storage = FlutterSecureStorage();
                      storage.write(
                          key: "Token", value: keyControlller.text.trim());
                      homepageRount(context);
                    },
                    color: primaryColor,
                    height: 42,
                    minWidth: mwidth * 0.94,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                    child: Text("Proceed", style: button(primaryTextColor)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
