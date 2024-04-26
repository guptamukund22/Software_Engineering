import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:paakshaala/constants/fridge_items.dart';
import 'package:paakshaala/fridge/items.dart';

class ItemProvider with ChangeNotifier {
  Future<bool> addItem(items item) async {
    const url = "http://10.23.16.166:8000/apis/v1/Users/Items/";
    print(json.encode(item));
    final response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: json.encode(item));
    print(response.statusCode);
    if (response.statusCode == 201) {
      items item_ = items(
          category: item.category,
          item_name: item.item_name,
          quantity: item.quantity,
          id: json.decode(response.body)['id']);

      item_.date = json.decode(response.body)['added_on'];
      print(item_.date);
      print(item_.id);
      catitems[item.category]!.add(item_);
      for (int i = 0; i < catitems[item_.category]!.length; i++) {
        print(catitems[item_.category]![i].item_name);
        print(catitems[item_.category]![i].id);
      }
      print(catitems[item_.category]!);
      print(json.encode(item_));
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> editItem(items olditem, items item) async {
    bool deleted = await deleteItem(olditem);
    bool added = false;
    if (deleted == true) {
      added = await addItem(item);
    }

    if (added = true) {
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteItem(items item) async {
    /* var item_needed = await fetchitems(item.category);
    int id = 0;
    for (int i = 0; i < item_needed.length; i++) {
      if(item_needed[i].category == item.category && item_needed[i].date == item.date && item_needed)
    }*/
    String url = "http://10.23.16.166:8000/apis/v1/Items/${item.id}/";

    final response = await http.delete(Uri.parse(url));
    if (response.statusCode == 204) {
      await catitems[item.category]!.remove(item);
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<List<items>> fetchitems(category) async {
    List<items> items_ = [];
    const url = "http://10.23.16.166:8000/apis/v1/Users/Items/?user=525";
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
