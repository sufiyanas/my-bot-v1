import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class Apisample {
  String apiKeyGpt = "";
  getimage({
    required String textPrompt,
  }) async {
    final baseUri = "https://api.openai.com/v1/images/generations";
    var url = Uri.parse(baseUri);
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiKeyGpt"
        },
        body: jsonEncode({"model": "image-alpha-001", "prompt": textPrompt}));

    return response;
  }
}
