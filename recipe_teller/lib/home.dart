// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:recipe_teller/my_flutter_app_icons.dart';
import 'package:recipe_teller/recipe/recipe.dart';

int active_index = 3;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        
        backgroundColor: Colors.transparent,
        actions: [
          Image.asset(
            "assets/images/circle2.png",
            height: 100,
            width: 100,
          )
        ],
      ),*/
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
          initialSelectedTab: "Home",
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
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(left: 20, top: 40),
                  child: Row(
                    children: [
                      Builder(
                          builder: (context) => IconButton(
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                              tooltip: MaterialLocalizations.of(context)
                                  .openAppDrawerTooltip,
                              icon: Icon(
                                Icons.table_rows_rounded,
                                color: Colors.white,
                                size: 30,
                              ))),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Paakshala",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  "Your consumption this week",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow()]),
              )
            ],
          ),
        ),
        Container(
          color: Colors.black,
        ),
        Container(
          color: Colors.red,
        )
      ][active_index],
    );
  }
}
