import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_teller/home.dart';

int position = 0;

class onboard extends StatefulWidget {
  @override
  State<onboard> createState() => _onboardState();
}

class _onboardState extends State<onboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context, CupertinoPageRoute(builder: (context) => Home()));
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.grey, Colors.white],
                stops: [0.1, 1])),
        child: Stack(
          children: [
            CarouselSlider(
                items: onboarding_story(),
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  height: 600,
                  onPageChanged: (index, reason) {
                    setState(() {
                      position = index;
                    });
                  },
                )),
            Positioned(
                top: MediaQuery.sizeOf(context).height * 0.58,
                left: MediaQuery.sizeOf(context).width * 0.35,
                child: DotsIndicator(
                  decorator: DotsDecorator(activeColor: Colors.blue[300]),
                  dotsCount: 5,
                  position: position,
                )),
          ],
        ),
      ),
    );
  }
}

List<Widget> onboarding_story() {
  List<Widget> feature = [];
  for (int i = 0; i < 5; i++) {
    feature.add(Column(children: [
      SizedBox(
        height: 80,
      ),
      Image.asset(
        "assets/images/tomato.png",
        width: 200,
      ),
      SizedBox(
        height: 20,
      ),
      Text("Tomatoes")
    ]));
  }
  return feature;
}
