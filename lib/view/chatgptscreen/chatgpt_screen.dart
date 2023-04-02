import 'package:flutter/material.dart';
import 'package:my_bot_v1/view/chatgptscreen/widgets/blinking_text.dart';
import 'package:my_bot_v1/view/chatgptscreen/widgets/bot_card.dart';
import 'package:my_bot_v1/view/chatgptscreen/widgets/question_card.dart';
import 'package:my_bot_v1/view/homescreen/application/home_notifier.dart';
import 'package:provider/provider.dart';

class ChatGptScreen extends StatelessWidget {
  const ChatGptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeNotifier>(context);
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: homeProvider.senderList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              questionCard(text: homeProvider.senderList[index]),
              index == homeProvider.senderList.length - 1 &&
                      homeProvider.dataLoading
                  ? BlinkingAnimation()
                  : BotCard(
                      text: homeProvider.reciverList[index],
                      index: index,
                      totalindux: homeProvider.reciverList.length),
              // : BlinkingAnimation()
            ],
          );
        },
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
