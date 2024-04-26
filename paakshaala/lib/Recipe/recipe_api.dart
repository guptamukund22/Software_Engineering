import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:paakshaala/constants/fridge_items.dart';
import 'package:paakshaala/fridge/items.dart';

String api = "http://10.23.16.166:8000/apis/v1/Recipe/";

class Recipe {
  final String name;
  final String type;
  final List<String> ingredients;

  final String instructions;
  final String course;
  final String website;
  Recipe(
      {required this.ingredients,
      required this.instructions,
      required this.course,
      required this.website,
      required this.name,
      required this.type});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
        name: json['name'],
        ingredients: json['ingredients'],
        instructions: json['instructions'],
        course: json['course'],
        website: json['website'],
        type: json['type']);
  }
}

void getRecipe(ingredients) async {
  var response = await http.get(Uri.parse('$api?ingredients=$ingredients'));
  if (response.statusCode == 200) {}
}

Future<Recipe> getRandomRecipe(id) async {
  var response = await http.get(Uri.parse('$api$id'));
  Recipe recipe = Recipe(
      ingredients: [''],
      instructions: "",
      course: '',
      website: '',
      name: '',
      type: '');
  if (response.statusCode == 200) {
    print(response.body);
    var data = json.decode(response.body);
    List<String> ingredients = getIngredients(data['ingredients']);
    recipe = Recipe(
        ingredients: ingredients,
        instructions: data['instructions'],
        course: data['course'],
        website: data['website'],
        name: data['name'],
        type: data['type']);
    return recipe;
  }
  return recipe;
}

List<String> getIngredients(String ingredients) {
  List<String> ingredients_ = [];
  String ingredient = '';
  for (int i = 0; i < ingredients.length; i++) {
    if (ingredients[i] != ',') {
      ingredient += ingredients[i];
    } else {
      ingredients_.add(ingredient);
      ingredient = '';
    }
  }
  print(ingredients_);
  return ingredients_;
}

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

  Future<List<Recipe>> fetchitems(category) async {
    List<Recipe> recipes_ = [];
    final response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      List<Recipe> temp_items_ =
          data.map((json) => Recipe.fromJson(json)).toList();
      for (int i = 0; i < temp_items_.length; i++) {
        recipes_.add(temp_items_[i]);
      }
      return recipes_;
    }
    return [];
  }
}
