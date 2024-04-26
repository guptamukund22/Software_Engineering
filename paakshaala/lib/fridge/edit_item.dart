// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paakshaala/constants/fonts.dart';
import 'package:paakshaala/fridge/add_category.dart';
import 'package:paakshaala/fridge/category_card.dart';
import 'package:paakshaala/fridge/items.dart';
import 'package:paakshaala/fridge/items_api.dart';

class EditItem extends StatefulWidget {
  const EditItem({super.key, required this.item});
  final items item;

  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  TextEditingController controller_item_name = TextEditingController();
  TextEditingController controller_quantity = TextEditingController();
  TextEditingController controller_date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text(
          'Edit item from ${widget.item.category}',
          style: gettextStyle(30),
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  TextField(
                    controller: controller_item_name
                      ..text = widget.item.item_name
                      ..text = widget.item.item_name,
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(10),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: controller_quantity
                      ..text = widget.item.quantity,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Enter Quantity of Item (in kg)",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    keyboardType: TextInputType.datetime,
                    controller: controller_date,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: "Date of Entry",
                        labelStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.all(10),
                        hintText: "dd/mm/yyyy",
                        hintStyle: TextStyle(color: Colors.grey)),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                ItemProvider provider = ItemProvider();
                bool edited = await provider.editItem(
                    widget.item,
                    items(
                      id: widget.item.id,
                      category: widget.item.category,
                      item_name: controller_item_name.text,
                      quantity: controller_quantity.text,
                    ));
                if (edited == true) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              Category_Card(category: widget.item.category)));
                }
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                width: MediaQuery.sizeOf(context).width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Save item",
                  style: gettextStyle(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
