import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paakshaala/Recipe/recipe_api.dart';
import 'package:paakshaala/authentication/ip.dart';
import 'package:paakshaala/constants/fonts.dart';
import 'package:paakshaala/constants/fridge_items.dart';
import 'package:paakshaala/cuisine/recipe_card.dart';

String salutation = '';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    get_ip();
    print("hello");

    print('hi');
    super.initState();
    int hour = DateTime.now().hour;

    if (hour >= 20 || hour < 5) {
      salutation = "Good Evening";
    } else if (hour >= 5 && hour < 10) {
      salutation = "Good Morning";
    } else if (hour >= 9 && hour < 12) {
      salutation = "Good Morning";
    } else if (hour >= 12 && hour < 16) {
      salutation = "Good Afternoon";
    } else if (hour >= 16 && hour < 20) {
      salutation = "Good Evening";
    }
  }

  void get_ip() async {
    await selfIP();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: Text(
                  "$salutation Sumeet!",
                  style: getStyle(20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Here are some picks for you",
                  style: gettextStyle(20),
                ),
              ),
              randomRecipe.length > 0
                  ? Recipecard(
                      recipeName: randomRecipe[0].name,
                      recipeInstructions: randomRecipe[0].instructions,
                      recipeIngredients: randomRecipe[0].ingredients,
                      servings: '4')
                  : Container(),
              SizedBox(
                height: 100,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
                child: Text(
                  "Last week nutrition value",
                  style: gettextStyle(20),
                ),
              )
            ],
          ),
        ));
  }
}
