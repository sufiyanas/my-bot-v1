import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:my_bot_v1/controller/service/chat_gpt_service.dart';
import 'package:my_bot_v1/controller/service/dalle_service.dart';

class HomeNotifier extends ChangeNotifier {
  bool _showsuffixIcon = false;
  final List<String> _senderList = [];
  final List<String> _reciverList = [];
  bool _dataLoading = false;
  String promt = "Question goes here in the line";
  String imageUrl = " ";

  bool get showsufficxIcon => _showsuffixIcon;
  List get senderList => _senderList;
  List get reciverList => _reciverList;
  bool get dataLoading => _dataLoading;

//for checking icon
  void updateSuffixIcon(String value) {
    if (value.isNotEmpty && !_showsuffixIcon) {
      _showsuffixIcon = true;
      notifyListeners();
    } else if (value.isEmpty && _showsuffixIcon) {
      _showsuffixIcon = false;
      notifyListeners();
    }
  }

//for adding sender lsit

  void addSenderList(String promt) async {
    _senderList.add(promt);
    _dataLoading = true;
    notifyListeners();

    final response = await generateText(promt);

    _reciverList.add(response);
    _dataLoading = false;
    notifyListeners();
  }

  //for ReciverList from API

  // void addReciverList(String promt) {
  //   _reciverList.add(promt);
  //   notifyListeners();
  // }

  //for text capture from the textformfield
  void changepromt(String text, BuildContext context) async {
    promt = text;
    notifyListeners();
    final Response response = await Apisample().getimage(textPrompt: text);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      imageUrl = data["data"][0]["url"];
      notifyListeners();
      log(imageUrl);
    } else {
      log(response.body);
      final data = jsonDecode(response.body);
      final message = data["error"]["message"];
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('Error'),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
              CupertinoDialogAction(
                isDefaultAction: true, // Add this line to add the divider line
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            ],
          );
        },
      );
    }
  }
}
