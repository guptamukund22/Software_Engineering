// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:paakshaala/Home/home.dart';
import 'package:paakshaala/Recipe/recipe.dart';
import 'package:paakshaala/constants/fonts.dart';
import 'package:paakshaala/constants/fridge_items.dart';
import 'package:paakshaala/contact_us/know_more.dart';
import 'package:paakshaala/cuisine/cuisines.dart';
import 'package:paakshaala/fridge/fridge.dart';
import 'package:paakshaala/Recipe/recipe_api.dart';
import 'package:paakshaala/my_flutter_app_icons.dart';

int active_index = 2;

class basic_structure extends StatefulWidget {
  const basic_structure({super.key});

  @override
  State<basic_structure> createState() => _HomeState();
}

class _HomeState extends State<basic_structure> {
  @override
  void initState() {
    super.initState();
    //  getrandom();
  }

  void getrandom() async {
    randomRecipe = [];
    Recipe recipe = await getRandomRecipe(Random().nextInt(6327));
    randomRecipe.add(recipe);
    print(randomRecipe);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: Colors.black,
        title: Text(
          "Paakshala",
          style: getStyle(25),
        ),
      ),
      drawer: Drawer(
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(5), bottomRight: Radius.circular(5))),
        backgroundColor: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const CircleAvatar(
              radius: 50,
              child: Text(
                "S",
                style: TextStyle(fontSize: 40),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Sumeet",
              style: TextStyle(fontSize: 30),
            ),
            const Divider(
              indent: 30,
              endIndent: 30,
              thickness: 3,
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.help,
                  size: 30,
                ),
                label: const Text(
                  "How to use?",
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ),
      ),
      backgroundColor: Colors.grey[900],
      bottomNavigationBar: MotionTabBar(
          icons: const [
            MyFlutterApp.food,
            MyFlutterApp.recipe,
            Icons.home,
            MyFlutterApp.fridge,
            Icons.person_sharp,
          ],
          onTabItemSelected: (value) {
            setState(() {
              active_index = value;
            });
          },
          initialSelectedTab: "Home",
          labels: const [
            "Cuisines",
            "Recipe Generator",
            "Home",
            "My Fridge",
            "About Us"
          ]),
      body: [
        Cuisines(),
        RecipePage(),
        home(),
        Fridge(),
        know_more()
      ][active_index],
    );
  }
}
