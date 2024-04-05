import 'dart:convert';
import 'package:flutter/material.dart';
import './items.dart';
import 'package:http/http.dart' as http;

class ItemProvided with ChangeNotifier {
  List<items> _items = [];

  List<items> get_items() {
    return [..._items];
  }

  fetchItems() async {
    const url = 'http://127.0.0.1:8000/apis/v1/?format=json';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _items = data.map<items>((json) => items.fromJson(json)).toList();
    }
  }
}
