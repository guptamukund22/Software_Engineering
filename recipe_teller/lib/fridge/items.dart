// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_teller/authentication/User_add.dart';
import 'package:recipe_teller/constants/fonts.dart';
import 'package:recipe_teller/fridge/chef_desk.dart';
import 'package:recipe_teller/fridge/delete_item.dart';
import 'package:recipe_teller/fridge/edit_item.dart';

int added = 0;

class items extends StatefulWidget {
  final String category;
  final String item_name;
  int? id;
  final String quantity;
  String? date;

  items({
    super.key,
    this.date,
    this.id,
    required this.category,
    required this.item_name,
    required this.quantity,
  });

  factory items.fromJson(Map<String, dynamic> json) {
    return items(
      id: json['id'],
      item_name: json['item_name'],
      category: json['category'],
      quantity: json['quantity'],
      date: json['added_on'],
    );
  }

  dynamic toJson() => {
        'id': DateTime.now().toString(),
        'category': category,
        "item_name": item_name,
        "quantity": quantity,
        'user': "Sumeet"
      };

  @override
  State<items> createState() => _itemsState();
}

class _itemsState extends State<items> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[800]),
      width: MediaQuery.sizeOf(context).width * 0.85,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              widget.item_name,
              style: gettextStyle(25),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "Quantity : ${widget.quantity}",
              style: gettextStyle(18),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "Added to fridge on : ${widget.date}",
              style: gettextStyle(18),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Container(
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: ((context) =>
                                    EditItem(item: widget))));
                      },
                      child: Text(
                        "Edit item",
                        style: gettextStyle(18),
                      )),
                ),
                const SizedBox(
                  width: 60,
                ),
                Container(
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    DeleteItem(item: widget)));
                      },
                      child: Text(
                        "Delete item",
                        style: gettextStyle(18),
                      )),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlue, width: 2),
                borderRadius: BorderRadius.circular(10)),
            child: TextButton.icon(
                onPressed: () {
                  if (added == 0) {
                    mychefDesk.add(widget.item_name);
                    setState(() {
                      added = 1;
                    });
                  } else {
                    mychefDesk.remove(widget.item_name);
                    setState(() {
                      added = 0;
                    });
                  }
                },
                icon: Image.asset(
                  [
                    "assets/images/chefDesk.png",
                    "assets/images/tick.png"
                  ][added],
                  height: 30,
                  width: 30,
                  color: [Colors.lightBlue, Colors.green][added],
                ),
                label: Text(
                  ["Add to Chef Desk", "Added to Chef Desk"][added],
                  style: gettextStyle(18),
                )),
          ),
        ],
      ),
    );
  }
}
