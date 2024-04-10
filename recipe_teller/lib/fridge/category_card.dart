// ignore_for_file: non_constant_identifier_names

import 'package:animations/animations.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_teller/authentication/User_add.dart';
import 'package:recipe_teller/constants/fonts.dart';
import 'package:recipe_teller/constants/fridge_items.dart';
import 'package:recipe_teller/fridge/add_item.dart';
import 'package:recipe_teller/fridge/camera.dart';
import 'package:recipe_teller/fridge/items.dart';
import 'package:recipe_teller/fridge/items_api.dart';
import 'package:recipe_teller/fridge/settings.dart';
import 'package:recipe_teller/onboarding/onboard.dart';

class CategoryCard extends StatefulWidget {
  final String category;
  const CategoryCard({super.key, required this.category});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        closedColor: Colors.grey[900]!,
        closedShape: const RoundedRectangleBorder(),
        closedBuilder: (context, action) {
          return SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.8,
            height: 150,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(top: 10, left: 30),
                  child: Text(widget.category, style: getStyle(20)),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.65,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final cameras = await availableCameras();
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    TakePicture(camera: cameras.first)));
                        /*   Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddItem(
                                      category: widget.category,
                                    )));*/
                      },
                      child: Container(
                        padding: const EdgeInsets.only(top: 60, left: 5),
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.blue[300],
                            child: const Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 30,
                              weight: 30,
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        openBuilder: ((context, action) {
          return Category_Card(category: widget.category);
        }));
  }
}

class Category_Card extends StatefulWidget {
  const Category_Card({super.key, required this.category});
  final String category;

  @override
  State<Category_Card> createState() => _CategoryState();
}

class _CategoryState extends State<Category_Card> {
  @override
  void initState() {
    get_items(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          leading: const BackButton(
            color: Colors.white,
          ),
          title: Text(
            widget.category,
            style: getStyle(25),
          ),
          actions: [
            PopupMenuButton(
                color: Colors.grey[800],
                iconColor: Colors.white,
                iconSize: 30,
                onSelected: (value) {
                  if (value == 1) {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => Settings(
                                  category: widget.category,
                                )));
                  }
                },
                itemBuilder: (context) => [
                      PopupMenuItem(
                          value: 1,
                          child: Text(
                            "Settings",
                            style: gettextStyle(20),
                          ))
                    ])
          ]),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Chef Desk - It is the collection of all items you want to use to cook food\n\nTo remove item from Chef Desk, click on the Add to Chef Desk Button again",
                style: gettextStyle(20),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "My Items",
                style: getStyle(20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                final cameras = await availableCameras();
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) =>
                            TakePicture(camera: cameras.first)));
                /* Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => AddItem(
                              category: widget.category,
                            )));*/
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                width: MediaQuery.sizeOf(context).width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Add item",
                  style: gettextStyle(20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            getItems(widget.category, context)
          ],
        ),
      ),
    );
  }
}

Widget getItems(String category, context) {
  List<Widget> items_ = [];

  for (int i = 0; i < catitems[category]!.length; i++) {
    items_.add(items(
        category: category,
        item_name: catitems[category]![i].item_name,
        quantity: catitems[category]![i].quantity,
        date: catitems[category]![i].date));
    items_.add(const SizedBox(
      height: 10,
    ));
  }
  return Container(
    decoration: BoxDecoration(
        color: Colors.grey[900], borderRadius: BorderRadius.circular(10)),
    width: MediaQuery.sizeOf(context).width * 0.9,
    alignment: Alignment.topLeft,
    padding: const EdgeInsets.all(10),
    child: Column(
      children: items_,
    ),
  );
}

void get_items(String category) async {
  ItemProvider provider = ItemProvider();
  catitems[category] = await provider.fetchitems(category);
}
