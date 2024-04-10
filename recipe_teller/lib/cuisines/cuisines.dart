import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_teller/constants/fonts.dart';

int selected_tab = 0;

class Cuisines extends StatefulWidget {
  @override
  State<Cuisines> createState() => _CuisinesState();
}

class _CuisinesState extends State<Cuisines> with TickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Hello Sumeet",
                  style: getStyle(25),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Have recipe do you want today?\nHave a look!",
                  style: gettextStyle(22),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: Container(
                width: MediaQuery.sizeOf(context).width * 0.8,
                child: SearchBar(
                  trailing: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                  hintText: "Search for Recipe",
                ),
              )),
              SizedBox(
                height: 20,
              ),
              TabBar(
                  controller: controller,
                  onTap: (value) {
                    setState(() {
                      selected_tab = value;
                    });
                  },
                  tabs: [
                    Text(
                      "All",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      "South Indian",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ]),
              SizedBox(
                height: 20,
              ),
              [
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(5)),
                  width: MediaQuery.sizeOf(context).width * 0.9,
                ),
                Container(
                  height: 300,
                  width: 500,
                  color: Colors.red,
                )
              ][selected_tab]
            ],
          ),
        ),
      ),
    );
  }
}
