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
                    mentor(
                        name: 'Dr. Romi Banerjee',
                        googlescholar:
                            'https://scholar.google.com/citations?user=BiSvmeMAAAAJ&hl=en',
                        page: "https://sites.google.com/site/romibitsnbob/home",
                        linkedin:
                            "https://www.linkedin.com/in/romi-banerjee-a045b5197/?originalSubdomain=in",
                        designation: 'Mentor',
                        position:
                            'Professor,\nIndian Institute of Technology, Jodhpur'),
                    member(
                        name: 'Sumeet S Patil',
                        linkedin:
                            'https://www.linkedin.com/in/sumeet-s-patil-6b85b0262/?originalSubdomain=in',
                        instagram: "https://www.instagram.com/sumeetpatil04/",
                        github: "https://github.com/ssp-8",
                        designation: 'Designer and Developer',
                        position: 'B.Tech 2nd year'),
                    member(
                        name: 'Mukund Gupta',
                        linkedin:
                            'https://www.linkedin.com/in/mukund-gupta-b93a252a0/?trk=people-guest_people_search-card&originalSubdomain=in',
                        instagram: "https://www.instagram.com/guptamukund22/",
                        github: "https://github.com/guptamukund22",
                        designation: 'Designer and Developer',
                        position: 'B.Tech 2nd year'),
                    member(
                        name: 'Tanmay Parashar',
                        linkedin:
                            'https://www.linkedin.com/in/tanmay-parashar-31432b263/?originalSubdomain=in',
                        instagram:
                            "https://www.instagram.com/tanmayparashar31/",
                        github: "https://github.com/tanmaycd",
                        designation: 'Developer and Tester',
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
                dotsCount: 4,
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
      required this.linkedin,
      required this.github,
      required this.instagram,
      required this.position})
      : super(key: key);

  final String designation;
  final String linkedin;
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
                      launchUrl(Uri.parse(widget.linkedin));
                    },
                    child: Image.asset(
                      "assets/images/linkedin.png",
                      height: 35,
                      width: 35,
                    )),
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

class mentor extends StatefulWidget {
  mentor(
      {Key? key,
      required this.name,
      required this.designation,
      required this.linkedin,
      required this.googlescholar,
      required this.page,
      required this.position})
      : super(key: key);

  final String designation;
  final String linkedin;
  final String googlescholar;
  final String page;
  final String name;
  final String position;

  @override
  State<mentor> createState() => _mentorState();
}

class _mentorState extends State<mentor> {
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
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              'Role: ${widget.designation}',
              style: GoogleFonts.lora(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              textAlign: TextAlign.center,
              "Currently: ${widget.position}",
              style: GoogleFonts.lora(fontSize: 20),
            ),
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
                      launchUrl(Uri.parse(widget.linkedin));
                    },
                    child: Image.asset(
                      "assets/images/linkedin.png",
                      height: 35,
                      width: 35,
                    )),
                SizedBox(
                  width: 50,
                ),
                GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse(widget.googlescholar));
                    },
                    child: Icon(
                      Icons.school,
                      color: Colors.black,
                      size: 35,
                    )),
                SizedBox(
                  width: 50,
                ),
                GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse(widget.page));
                  },
                  child: Image.asset(
                    "assets/images/website.png",
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
