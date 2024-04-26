import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Category {
  final String category;

  Category({required this.category});

  dynamic toJson() => {'id': DateTime.now().toString(), 'name': category};
}

class CategoryProvider with ChangeNotifier {
  Future<bool> addCategory(Category category) async {
    const url = "http://172.31.36.248:8000/apis/v1/categories/";
    print(category.toJson());
    print(json.encode(category));
    final response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(category));
    print(response.statusCode);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
