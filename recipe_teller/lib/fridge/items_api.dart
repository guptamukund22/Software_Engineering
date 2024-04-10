import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:recipe_teller/constants/fridge_items.dart';
import 'package:recipe_teller/fridge/items.dart';
import 'package:http/http.dart' as http;

class ItemProvider with ChangeNotifier {
  Future<bool> addItem(items item) async {
    const url = "http://172.31.36.248:8000/apis/v1/Items/";
    print(json.encode(item));
    final response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: json.encode(item));
    print(response.statusCode);
    if (response.statusCode == 201) {
      item.id = json.decode(response.body)['id'];
      item.date = json.decode(response.body)['added_on'];
      catitems[item.category]!.add(item);
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> editItem(items olditem, items item) async {
    String url = "http://172.31.36.248:8000/apis/v1/Items/${item.id}/";
    final response = await http.put(Uri.parse(url));
    if (response.statusCode == 201) {
      item.id = json.decode(response.body)['id'];
      item.date = json.decode(response.body)['added_on'];
      catitems[olditem.category]!.remove(olditem);
      catitems[item.category]!.add(item);

      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteItem(items item) async {
    String url = "http://172.31.36.248:8000/apis/v1/Items/${item.id}/";
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode == 204) {
      catitems[item.category]!.remove(item);
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<List<items>> fetchitems(category) async {
    List<items> items_ = [];
    const url = "http://172.31.36.248:8000/apis/v1/Items/";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      List<items> temp_items_ =
          data.map((json) => items.fromJson(json)).toList();
      for (int i = 0; i < temp_items_.length; i++) {
        if (temp_items_[i].category == category) {
          items_.add(temp_items_[i]);
        }
      }
      return items_;
    }
    return [];
  }
}
