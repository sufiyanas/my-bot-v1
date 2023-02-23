import 'package:flutter/cupertino.dart';
import 'package:my_bot_v1/utils/colors.dart';
import 'package:my_bot_v1/utils/consts.dart';
import 'package:my_bot_v1/utils/strings.dart';

class BlinkingAnimation extends StatefulWidget {
  @override
  _BlinkingAnimationState createState() => _BlinkingAnimationState();
}

class _BlinkingAnimationState extends State<BlinkingAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _controller!.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth12,
        Image.asset(
          "assets/images/botDp.png",
          width: 24,
          height: 24,
        ),
        kWidth10,
        FadeTransition(
            opacity: _controller!,
            child: Container(
              width: 13,
              height: 20,
              decoration: BoxDecoration(
                  color: primaryTextColor,
                  borderRadius: BorderRadius.circular(3)),
            )),
      ],
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}
