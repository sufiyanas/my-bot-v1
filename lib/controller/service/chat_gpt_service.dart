import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:my_bot_v1/main.dart';
import 'dart:convert';

String model = "text-davinci-002";
// const storage = FlutterSecureStorage();
Future<String> generateText(String prompt) async {
  final token = await storage.read(key: "token");
  final baseUrl = "https://api.openai.com/v1/engines/$model/completions";
  var url = Uri.parse(baseUrl);
  var body = jsonEncode({"prompt": prompt, "max_tokens": 7, "temperature": 0});
  var response = await http.post(url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: body);

  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);

    return jsonResponse["choices"][0]["text"];
  } else {
    var jsonResponse = jsonDecode(response.body);

    if (jsonResponse["error"]["code"] == "invalid_api_key") {
      storage.deleteAll();
    }
    //log(jsonResponse.toString());
    //log(jsonResponse["error"]["message"]);
    return jsonResponse["error"]["message"];
  }
}
