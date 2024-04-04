import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

int position = 0;

class know_more extends StatefulWidget {
  @override
  State<know_more> createState() => _know_moreState();
}

class _know_moreState extends State<know_more> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 20, bottom: 10),
                child: Text(
                  "About us",
                  style: GoogleFonts.libreBaskerville(
                      color: Colors.white, fontSize: 30),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 20, bottom: 20),
                child: Text(
                  "Hello Users!",
                  style: GoogleFonts.libreBaskerville(
                      color: Colors.white, fontSize: 20),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 20, bottom: 10),
                child: Text(
                  "Meet our team",
                  style: GoogleFonts.libreBaskerville(
                      color: Colors.white, fontSize: 25),
                ),
              ),
              CarouselSlider(
                  items: [
                    member(
                        name: 'Sumeet',
                        designation: 'Developer',
                        position: 'B.Tech 2nd year'),
                    member(
                        name: 'Sumeet',
                        designation: 'Developer',
                        position: 'B.Tech 2nd year'),
                    member(
                        name: 'Sumeet',
                        designation: 'Developer',
                        position: 'B.Tech 2nd year'),
                    member(
                        name: 'Sumeet',
                        designation: 'Developer',
                        position: 'B.Tech 2nd year'),
                    member(
                        name: 'Sumeet',
                        designation: 'Developer',
                        position: 'B.Tech 2nd year'),
                  ],
                  options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          position = index;
                        });
                      },
                      padEnds: true,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      viewportFraction: 1,
                      height: 400)),
              SizedBox(
                height: 10,
              ),
              DotsIndicator(
                dotsCount: 5,
                position: position,
                decorator: DotsDecorator(activeColor: Colors.blue),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  "User Policies",
                  style: GoogleFonts.libreBaskerville(
                      color: Colors.white, fontSize: 25),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  "Click on this to see our policies",
                  style: GoogleFonts.roboto(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class member extends StatelessWidget {
  member(
      {Key? key,
      required this.name,
      required this.designation,
      required this.position})
      : super(key: key);

  final String designation;
  final String name;
  final String position;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      color: Colors.blue[300],
    );
  }
}
