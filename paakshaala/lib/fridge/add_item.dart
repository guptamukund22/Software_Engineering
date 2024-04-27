// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paakshaala/constants/fonts.dart';
import 'package:paakshaala/fridge/category_card.dart';
import 'package:paakshaala/fridge/items.dart';
import 'package:paakshaala/fridge/items_api.dart';

String unit = 'kg';
int duration = 2;

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        width: 200,
                        child: TextField(
                          controller: controller_quantity,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                              hintText: "Enter Quantity of Item",
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 50,
                        child: DropdownMenu(
                            width: 100,
                            initialSelection: 1,
                            textStyle: TextStyle(color: Colors.grey),
                            onSelected: (value) {
                              print(value);
                              if (value == 2) {
                                unit = 'ml';
                              } else if (value == 3) {
                                unit = 'g';
                              } else if (value == 4) {
                                unit = 'l';
                              } else {
                                unit = 'kg';
                              }
                            },
                            dropdownMenuEntries: const [
                              DropdownMenuEntry(value: 1, label: "kg"),
                              DropdownMenuEntry(value: 2, label: "ml"),
                              DropdownMenuEntry(value: 3, label: 'g'),
                              DropdownMenuEntry(value: 4, label: 'l')
                            ]),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 200,
                        alignment: Alignment.topLeft,
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.datetime,
                          controller: controller_date,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: "Reminder Duration",
                            labelStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.all(10),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      DropdownMenu(
                          width: 110,
                          initialSelection: 1,
                          textStyle: TextStyle(color: Colors.grey),
                          onSelected: (value) {
                            duration = value!;
                          },
                          dropdownMenuEntries: const [
                            DropdownMenuEntry(value: 1, label: "Months"),
                            DropdownMenuEntry(value: 2, label: "Days"),
                          ]),
                    ],
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
                  id: 0,
                  category: widget.category,
                  item_name: controller_item_name.text,
                  quantity: '${controller_quantity.text} $unit',
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
