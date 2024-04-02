import 'package:flutter/material.dart';

class recipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Positioned(
                    top: 250,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            "HI",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 200,
                          ),
                          Text(
                            "HI",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 200,
                          ),
                          Text(
                            "HI",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 200,
                          ),
                          Text(
                            "HI",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )),
                Positioned(
                  top: 0,
                  child: Container(
                    height: 180,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(100, 90),
                            bottomRight: Radius.elliptical(100, 90))),
                  ),
                ),
                Positioned(
                  top: 70,
                  left: MediaQuery.sizeOf(context).width * 0.12,
                  child: Image.asset(
                    "assets/images/recipe.png",
                    width: 300,
                  ),
                ),
              ],
            )));
  }
}
