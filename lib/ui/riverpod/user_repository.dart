import 'dart:convert';

import 'package:first_app/ui/riverpod/user.dart';

class UserRepository {
  // Always asynchronous when communicating with the server!
  Future<User> getUser() async {
    // It takes time to receive data from the server,
    // so wait before executing the next line
    //
    // Here, we use Future.delayed to simulate
    // a 1-second server response time
    await Future.delayed(const Duration(microseconds: 1));

    // A JSON string simulating data received from the server
    String serverResponse = """
    {
    	"name": "이지원",
    	"age": 20
    }
    """;

    // Convert the JSON-format string received from the server into a Map
    Map<String, dynamic> map = jsonDecode(serverResponse);

    // Convert the Map data into a User object
    User user = User.fromJson(map);

    // Return the converted User object
    return user;
  }
}
