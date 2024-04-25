// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:paakshaala/constants/fonts.dart';

class Settings extends StatefulWidget {
  const Settings({super.key, required this.category});
  final String category;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller_notification_time = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        title: Text(
          "Settings",
          style: getStyle(20),
        ),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 5),
                child: Text("Category", style: gettextStyle(25))),
            TextField(
              controller: controller..text = widget.category,
              style: getStyle(25),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 5),
                child: Text("Reminder in Days", style: gettextStyle(25))),
            TextField(
              controller: controller_notification_time..text = '6 Months',
              style: getStyle(25),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 50,
                alignment: Alignment.center,
                width: MediaQuery.sizeOf(context).width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Save Changes",
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
