import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_bot_v1/utils/apikeys.dart';

String model = "text-davinci-002";

Future<String> generateText(String prompt) async {
  final baseUrl = "https://api.openai.com/v1/engines/$model/completions";
  var url = Uri.parse(baseUrl);
  var body = jsonEncode({"prompt": prompt, "max_tokens": 7, "temperature": 0});
  var response = await http.post(url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKey"
      },
      body: body);

  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);

    return jsonResponse["choices"][0]["text"];
  } else {
    log("failed");
    var jsonResponse = jsonDecode(response.body);

    //log(jsonResponse["error"]["message"]);
    return jsonResponse["error"]["message"];
  }
}
