import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_bot_v1/utils/colors.dart';
import 'package:my_bot_v1/utils/consts.dart';
import 'package:my_bot_v1/utils/strings.dart';
import 'package:my_bot_v1/view/homescreen/application/togle_notify.dart';
import 'package:provider/provider.dart';

class ToggleBar extends StatelessWidget {
  ToggleBar({super.key});

  @override
  Widget build(BuildContext context) {
    var online = Provider.of<ToggleNotifier>(context).isOnline;
    final mwidth = MediaQuery.of(context).size.width;
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          height: 36,
          width: mwidth * 0.90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: inputFieldBackgrount),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 4,
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<ToggleNotifier>(context, listen: false)
                      .toggleOn();
                },
                child: Hero(
                  tag: 'ChatGpt',
                  transitionOnUserGestures: true,
                  child: AnimatedContainer(
                    height: 28,
                    duration: const Duration(milliseconds: 110),
                    width: mwidth * 0.43,
                    decoration: BoxDecoration(
                        color:
                            online ? secondaryTextColor : inputFieldBackgrount,
                        borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.fromLTRB(2, 2, 0, 2),
                    child: Center(
                      child: Text('ChatGPT', style: button(primaryTextColor)),
                    ),
                  ),
                ),
              ),
              kWidth6,
              GestureDetector(
                onTap: () {
                  Provider.of<ToggleNotifier>(context, listen: false)
                      .toggleOff();
                },
                child: Hero(
                  tag: 'Dall-E',
                  transitionOnUserGestures: true,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 110),
                    height: 28,
                    width: mwidth * 0.43,
                    decoration: BoxDecoration(
                        color:
                            online ? inputFieldBackgrount : secondaryTextColor,
                        borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.fromLTRB(2, 2, 0, 2),
                    child: Center(
                        child: Text(
                      'Dall-E',
                      style: button(primaryTextColor),
                      //style:
                    )),
                  ),
                ),
              ),
            ],
          ))
    ]);
  }
}
