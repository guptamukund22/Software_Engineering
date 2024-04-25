// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paakshaala/constants/fonts.dart';
import 'package:paakshaala/fridge/category_card.dart';
import 'package:paakshaala/fridge/items.dart';
import 'package:paakshaala/fridge/items_api.dart';

class DeleteItem extends StatefulWidget {
  const DeleteItem({super.key, required this.item});
  final items item;

  @override
  State<DeleteItem> createState() => _DeleteItemState();
}

class _DeleteItemState extends State<DeleteItem> {
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
          'Item Preview',
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
                    enabled: false,
                    controller: controller_item_name
                      ..text = 'Item Name: ${widget.item.item_name}',
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    enabled: false,
                    controller: controller_quantity
                      ..text = 'Quantity: ${widget.item.quantity}',
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    enabled: false,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    keyboardType: TextInputType.datetime,
                    controller: controller_date
                      ..text = 'Date of Entry: ${widget.item.date}',
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                    ),
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

                bool deleted = await provider.deleteItem(widget.item);
                if (deleted) {
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
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Delete item",
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
