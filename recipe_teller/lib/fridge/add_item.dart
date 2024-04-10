// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_teller/constants/fonts.dart';
import 'package:recipe_teller/fridge/category_card.dart';
import 'package:recipe_teller/fridge/items.dart';
import 'package:recipe_teller/fridge/items_api.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key, required this.category});
  final String category;

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController controller_item_name = TextEditingController();
  TextEditingController controller_quantity = TextEditingController();
  TextEditingController controller_date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text(
          'Add item to ${widget.category}',
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
                    controller: controller_item_name,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Enter Item Name",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: controller_quantity,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
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
                    style: const TextStyle(color: Colors.white),
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
                print(widget.category);
                bool added = await provider.addItem(items(
                  id: 1,
                  category: widget.category,
                  item_name: controller_item_name.text,
                  quantity: controller_quantity.text,
                  date: controller_date.text,
                ));

                if (added) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              Category_Card(category: widget.category)));
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
                  "Add item",
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
