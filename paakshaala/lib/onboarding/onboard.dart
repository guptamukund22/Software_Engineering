import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:paakshaala/basic_structure.dart';
import 'package:paakshaala/onboarding/first_page.dart';
import 'package:paakshaala/onboarding/fourth_page.dart';
import 'package:paakshaala/onboarding/second_page.dart';
import 'package:paakshaala/onboarding/third_page.dart';

int position = 0;
List<String> button_text = ['Next', 'Next', 'Next', ''];
int button = 0;

class onboard extends StatefulWidget {
  @override
  State<onboard> createState() => _onboardState();
}

class _onboardState extends State<onboard> {
  CarouselController controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              child: CarouselSlider(
                  carouselController: controller,
                  items: [
                    first_page(),
                    second_page(),
                    third_page(),
                    fourth_page()
                  ],
                  options: CarouselOptions(
                    pauseAutoPlayOnManualNavigate: false,
                    initialPage: position,
                    padEnds: true,
                    enableInfiniteScroll: false,
                    viewportFraction: 1,
                    height: 650,
                    onPageChanged: (index, reason) {
                      setState(() {
                        position = index;
                        if (index == 3) {
                          button = 1;
                        } else {
                          button = 0;
                        }
                      });
                    },
                  )),
            ),
            Row(
              children: [
                SizedBox(
                  width: 150,
                ),
                Center(
                  child: DotsIndicator(
                    decorator: DotsDecorator(activeColor: Colors.blue[300]),
                    dotsCount: 4,
                    position: position,
                  ),
                ),
                SizedBox(
                  width: 60,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (position != 3) {
                        position++;
                        controller.animateToPage(position);
                      }
                    });
                  },
                  child: Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.only(right: 30),
                    child: Text(
                      button_text[position],
                      style: TextStyle(
                          color: Colors.blue[300],
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            [
              Container(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => basic_structure()));
                },
                child: Container(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        color: Colors.blue[300],
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ][button]
          ],
        ));
  }
}
