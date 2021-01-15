import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

Future<void> createUsers() async {
  /// Creates dummy users on the given server and logs it

  var server_url = "YOUR_NGROK_SERVER_URL/token";
  Map<String, String> headers = {
    'Content-Type': 'application/json'
  };
  List user_list = [
    'userA',
    'userB'
  ];

  for (String user in user_list) {
    var body = json.encode({
      "userId": user,
    });
    var tokenResponse = await post(server_url, body: body, headers: headers);
    var userToken = jsonDecode(tokenResponse.body)['token'];
    log('$server_url : $user : $userToken');
  }
}
