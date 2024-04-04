// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:recipe_teller/Home/home.dart';
import 'package:recipe_teller/contact_us/know_more.dart';
import 'package:recipe_teller/my_flutter_app_icons.dart';
import 'package:recipe_teller/recipe/recipe.dart';

int active_index = 3;

class basic_structure extends StatefulWidget {
  const basic_structure({super.key});

  @override
  State<basic_structure> createState() => _HomeState();
}

class _HomeState extends State<basic_structure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
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
          initialSelectedTab: "About Us",
          labels: const [
            "Cuisines",
            "Recipe Teller",
            "Home",
            "Fridge",
            "About Us"
          ]),
      body: [
        Container(
          color: Colors.blue,
        ),
        recipe(),
        home(),
        Container(
          color: Colors.black,
        ),
        know_more()
      ][active_index],
    );
  }
}
