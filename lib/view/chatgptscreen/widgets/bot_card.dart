import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_bot_v1/utils/colors.dart';
import 'package:my_bot_v1/utils/consts.dart';
import 'package:my_bot_v1/utils/strings.dart';

class BotCard extends StatefulWidget {
  BotCard({
    Key? key,
    required this.text,
    required this.index,
    required this.totalindux,
  }) : super(key: key);

  final String text;
  final int totalindux;
  final int index;

  @override
  _BotCardState createState() => _BotCardState();
}

class _BotCardState extends State<BotCard> {
  bool _shouldAnimate = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kWidth12,
        Image.asset(
          "assets/images/botDp.png",
          width: 24,
          height: 24,
        ),
        kWidth10,
        Expanded(
          child: (_shouldAnimate && widget.index != widget.totalindux)
              ? DefaultTextStyle(
                  style: body1(primaryTextColor),
                  child: AnimatedTextKit(
                    repeatForever: false,
                    totalRepeatCount: 1,
                    onFinished: () {
                      setState(() {
                        _shouldAnimate = false;
                      });
                    },
                    animatedTexts: [TypewriterAnimatedText(widget.text)],
                  ),
                )
              : Text(
                  widget.text,
                  style: body1(primaryTextColor),
                ),
        ),
      ],
    );
  }
}
