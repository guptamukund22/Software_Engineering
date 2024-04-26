import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import './items.dart';
import 'package:http/http.dart' as http;

/*class ItemProvided with ChangeNotifier {
  List<items> _items = [];

  List<items> get_items() {
    fetchItems();
    return _items;
  }

  fetchItems() async {
    Client client = http.Client();
    const url = 'http://172.31.51.39:8000/apis/v1/';
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      print(data);
      _items = data.map<items>((json) => items.fromJson(json)).toList();
    }
  }
}*/
