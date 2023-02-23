import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:my_bot_v1/controller/service/chat_gpt_service.dart';

class HomeNotifier extends ChangeNotifier {
  bool _showsuffixIcon = false;
  final List<String> _senderList = [];
  final List<String> _reciverList = [];
  bool _dataLoading = false;

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
}
