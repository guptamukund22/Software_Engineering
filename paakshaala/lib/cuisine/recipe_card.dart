// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:paakshaala/constants/fonts.dart';

class Recipecard extends StatelessWidget {
  final String recipeName;
  final String recipeInstructions;
  final List<String> recipeIngredients;
  final String servings;
  const Recipecard(
      {super.key,
      required this.recipeName,
      required this.recipeInstructions,
      required this.recipeIngredients,
      required this.servings});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/chopboard.png"),
                fit: BoxFit.cover),
            color: Colors.black,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Text(
              recipeName,
              style: getStyle(25),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Servings: $servings",
                style: gettextStyle(20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
