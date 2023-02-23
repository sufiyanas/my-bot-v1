import 'package:flutter/material.dart';
import 'package:my_bot_v1/utils/colors.dart';
import 'package:my_bot_v1/utils/consts.dart';
import 'package:my_bot_v1/utils/strings.dart';

class DallEScreen extends StatelessWidget {
  const DallEScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 45,
              color: inputFieldBackgrount,
              child: Row(
                children: [
                  kWidth15,
                  Icon(
                    Icons.account_circle_outlined,
                    color: secondaryTextColor,
                  ),
                  kWidth5,
                  Text(
                    "Question goes here in the line..",
                    style: body1(primaryTextColor),
                  ),
                ],
              ),
            ),
            kHeight20,
            Container(
              width: mwidth * 0.90,
              height: mwidth,
              decoration: BoxDecoration(
                  // image: DecorationImage(image: AssetImage("")),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: inputFieldBackgrount,
                  )),
              child: Stack(
                children: [
                  Positioned(
                      right: 10,
                      bottom: 10,
                      child: CircleAvatar(
                        backgroundColor: inputFieldBackgrount,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.file_download_outlined,
                              color: secondaryTextColor,
                            )),
                      ))
                ],
              ),
            )
          ],
        ));
  }
}
