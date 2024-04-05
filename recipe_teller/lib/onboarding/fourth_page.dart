import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class fourth_page extends StatelessWidget {
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
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Image.asset(
                "assets/images/diet.png",
                height: 300,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 190,
              child: Column(
                children: [
                  Text(
                    "Nutritional highlights",
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
                    " Know each recipe's nutritional content\n and then decide what to cook!",
                    textAlign: TextAlign.left,
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
