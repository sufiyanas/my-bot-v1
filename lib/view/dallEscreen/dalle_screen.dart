import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_bot_v1/utils/colors.dart';
import 'package:my_bot_v1/utils/consts.dart';
import 'package:my_bot_v1/utils/strings.dart';
import 'package:my_bot_v1/view/homescreen/application/home_notifier.dart';
import 'package:provider/provider.dart';

class DallEScreen extends StatelessWidget {
  const DallEScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeNotifer = Provider.of<HomeNotifier>(context);
    final mwidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: ListView(
        children: [
          Container(
            // width: double.infinity,
            height: 45,
            color: inputFieldBackgrount,
            child: Row(
              children: [
                kWidth15,
                const Icon(
                  Icons.account_circle_outlined,
                  color: secondaryTextColor,
                ),
                kWidth5,
                Text(
                  homeNotifer.promt,
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
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: inputFieldBackgrount,
              ),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: black,
                      child: const Center(
                        child: CupertinoActivityIndicator(radius: 15),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: (homeNotifer.imageUrl == " ")
                            ? const AssetImage(
                                "assets/images/demo_img_dalle.jpg")
                            : NetworkImage(homeNotifer.imageUrl)
                                as ImageProvider,
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //   right: 10,
                //   bottom: 10,
                //   child: CircleAvatar(
                //     backgroundColor: inputFieldBackgrount,
                //     child: IconButton(
                //       onPressed: () {},
                //       icon: const Icon(
                //         Icons.file_download_outlined,
                //         color: secondaryTextColor,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          kHeight20
        ],
      ),
    );
  }
}
