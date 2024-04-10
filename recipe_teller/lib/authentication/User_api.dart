import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:recipe_teller/authentication/User_add.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  Future<bool> addUser(User user) async {
    const url = "http://172.31.36.248:8000/apis/v1/Users/";
    print(user.toJson());
    print(json.encode(user));
    final response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: json.encode(user));
    print(response.statusCode);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
