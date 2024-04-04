import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_teller/basic_structure.dart';
import 'package:recipe_teller/onboarding/fourth_page.dart';

class third_page extends StatelessWidget {
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
            Center(
              child: Image.asset(
                "assets/images/cuisine.png",
                height: 300,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 190,
              child: Column(
                children: [
                  Text(
                    "Indian Cuisines",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.libreBaskerville(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    " Get to know the rich Indian Food\n culture and their recipes",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.baskervville(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
