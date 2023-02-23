import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_bot_v1/utils/colors.dart';
import 'package:my_bot_v1/utils/consts.dart';
import 'package:my_bot_v1/utils/strings.dart';

class questionCard extends StatelessWidget {
  const questionCard({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      color: inputFieldBackgrount,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 22,
            child: Icon(
              Icons.account_circle_outlined,
              size: 25,
              color: secondaryTextColor,
            ),
          ),
          kWidth5,
          Expanded(
            child: Text(
              text,
              style: body1(primaryTextColor),
            ),
          )
        ],
      ),
    );
  }
}
