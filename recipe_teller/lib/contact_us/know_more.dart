import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "We at recipe teller, strive to provide to the Users, good and customized recipes.\n\nWe envision to give a new look to the age-old tasty and healthy Indian Cuisines.",
                  style: GoogleFonts.libreBaskerville(
                      color: Colors.white, fontSize: 17),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
                child: Text(
                  "Meet our team",
                  style: GoogleFonts.libreBaskerville(
                      color: Colors.white, fontSize: 25),
                ),
              ),
              CarouselSlider(
                  items: [
                    member(
                        name: 'Sumeet S Patil',
                        mailid: 'sumeetpatil20004@gmail.com',
                        instagram: "https://www.instagram.com/sumeetpatil04/",
                        github: "https://github.com/ssp-8",
                        designation: 'Developer',
                        position: 'B.Tech 2nd year'),
                    member(
                        name: 'Sumeet S Patil',
                        mailid: 'sumeetpatil20004@gmail.com',
                        instagram: "https://www.instagram.com/sumeetpatil04/",
                        github: "https://github.com/ssp-8",
                        designation: 'Developer',
                        position: 'B.Tech 2nd year'),
                    member(
                        name: 'Sumeet S Patil',
                        mailid: 'sumeetpatil20004@gmail.com',
                        instagram: "https://www.instagram.com/sumeetpatil04/",
                        github: "https://github.com/ssp-8",
                        designation: 'Developer',
                        position: 'B.Tech 2nd year'),
                    member(
                        name: 'Sumeet S Patil',
                        mailid: 'sumeetpatil20004@gmail.com',
                        instagram: "https://www.instagram.com/sumeetpatil04/",
                        github: "https://github.com/ssp-8",
                        designation: 'Developer',
                        position: 'B.Tech 2nd year'),
                    member(
                        name: 'Sumeet S Patil',
                        mailid: 'sumeetpatil20004@gmail.com',
                        instagram: "https://www.instagram.com/sumeetpatil04/",
                        github: "https://github.com/ssp-8",
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

class member extends StatefulWidget {
  member(
      {Key? key,
      required this.name,
      required this.designation,
      required this.mailid,
      required this.github,
      required this.instagram,
      required this.position})
      : super(key: key);

  final String designation;
  final String mailid;
  final String github;
  final String instagram;
  final String name;
  final String position;

  @override
  State<member> createState() => _memberState();
}

class _memberState extends State<member> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.lightBlue[200],
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
              height: 120,
              width: 120,
              decoration:
                  BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
              child: Icon(
                Icons.person_sharp,
                size: 100,
              )),
          Text(
            widget.name,
            style: GoogleFonts.lora(fontSize: 30),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Role: ${widget.designation}',
            style: GoogleFonts.lora(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Currently: ${widget.position}",
            style: GoogleFonts.lora(fontSize: 20),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 50),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    launchUrl(Uri(
                      scheme: 'mailto',
                      path: widget.mailid,
                      query: encodeQueryParameters(<String, String>{
                        'subject': 'Contact',
                      }),
                    ));
                  },
                  child: Icon(
                    Icons.mail_outline,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse(widget.github));
                  },
                  child: Image.asset(
                    "assets/images/github.png",
                    height: 35,
                    width: 35,
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse(widget.instagram));
                  },
                  child: Image.asset(
                    "assets/images/instagram.png",
                    height: 35,
                    width: 35,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
