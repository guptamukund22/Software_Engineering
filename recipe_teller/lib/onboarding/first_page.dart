import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_teller/basic_structure.dart';

class first_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30, right: 10),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => basic_structure()));
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.blue, fontSize: 25),
                  )),
            ),
            const SizedBox(
              height: 60,
            ),
            Image.asset(
              "assets/images/cook.png",
              height: 300,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 170,
              child: Column(
                children: [
                  Text(
                    "New Recipes",
                    style: GoogleFonts.libreBaskerville(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    " Hungry, but don't know what to cook!\n Get new recipes with Indian touch",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.baskervville(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            /* Center(
                child: DotsIndicator(
                  decorator: DotsDecorator(activeColor: Colors.blue[300]),
                  dotsCount: 5,
                  position: 0,
                ),
              ),*/
          ],
        ),
      ),
    );
  }
}
