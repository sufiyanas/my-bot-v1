import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:my_bot_v1/main.dart';

class Apisample {
  String apiKeyGpt = "";
  getimage({
    required String textPrompt,
  }) async {
    final token = await storage.read(key: "token");
    const baseUri = "https://api.openai.com/v1/images/generations";
    var url = Uri.parse(baseUri);
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode({"model": "image-alpha-001", "prompt": textPrompt}));

    return response;
  }
}
