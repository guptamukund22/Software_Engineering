import 'package:flutter/material.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
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
        ));
  }
}
