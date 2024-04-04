import 'dart:math';

//import 'package:email_otp/email_otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:recipe_teller/basic_structure.dart';

List<String> recipients = [];
//EmailOTP myauth = EmailOTP();

TextEditingController? _controller;
TextEditingController? _otp;
String otp = '';
bool verified = false;
int otp_write = 0;

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int otp_sent = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 210,
                  width: MediaQuery.sizeOf(context).width,
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/dot.jpg"),
                                fit: BoxFit.cover)),
                        height: 100,
                        width: 150,
                      ),
                      Positioned(
                        left: MediaQuery.sizeOf(context).width * 0.65,
                        child: Container(
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/cir.png"),
                                  fit: BoxFit.cover)),
                          height: 210,
                          width: 200,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 25, bottom: 10),
                  child: Text("Create Account",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w500)),
                ),
                Container(
                  padding: EdgeInsets.only(left: 25, bottom: 20),
                  child: Text("Please enter valid details to continue",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w200)),
                ),
                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 25),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white10,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          field(
                            obscure: true,
                            hint: "Username",
                            icon: Icon(Icons.person),
                          ),
                          Container(
                            width: 250,
                            height: 5,
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(
                                        color: Colors.white10, width: 0.5))),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          field_phone(
                            hint: "Mail",
                            icon: Icon(Icons.mail),
                          ),
                          Container(
                            width: 250,
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(
                                        color: Colors.white10, width: 0.5))),
                            height: 5,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextButton(
                              onPressed: () async {
                                var rng = Random();
                                otp = '';
                                for (int j = 0; j < 4; j++) {
                                  int num = rng.nextInt(9);
                                  otp = otp + num.toString();
                                }
                                print(recipients);
                                final SmtpServer = gmail(
                                    'recipe.teller.iitj@gmail.com',
                                    "jnbxxfynzzopiwid");
                                final Message message = Message();
                                message.from = Address(
                                    'recipe.teller.iitj@gmail.com',
                                    'Recipe Teller');
                                message.recipients = [
                                  recipients[recipients.length - 1]
                                ];
                                message.subject = "OTP Verification";
                                message.text =
                                    "Welcome to our App.\n Your OTP is $otp";
                                await send(message, SmtpServer);
                                /* myauth.setConfig(
                                    appName: "Recipe Teller",
                                    appEmail: "sumeetpatil20004@gmail.com",
                                    userEmail:
                                        recipients[recipients.length - 1],
                                    otpLength: 6,
                                    otpType: OTPType.digitsOnly);
                                await myauth.sendOTP();*/

                                setState(() {
                                  otp_sent = 1;
                                });
                              },
                              child: Text("Get OTP")),
                          [
                            Container(),
                            field_otp(
                              hint: "Enter the OTP",
                              icon: Icon(Icons.lock),
                            )
                          ][otp_sent],
                          Container(
                            width: 250,
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(
                                        color: Colors.white10, width: 0.5))),
                            height: 5,
                          ),
                          [
                            Container(),
                            Center(
                              child: Container(
                                height: 40,
                                width: 120,
                                child: Text(
                                  "Wrong OTP\nEnter valid OTP",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ),
                            )
                          ][otp_write],
                        ],
                      ),
                    )),
                Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.sizeOf(context).width * 0.6, top: 20),
                  child: GestureDetector(
                    onTap: () {
                      if (verified) {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => basic_structure()));
                      } else {
                        setState(() {
                          otp_write = 1;
                        });
                      }
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 90,
                          height: 40,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              color: Color.fromRGBO(66, 165, 245, 0.7)),
                          alignment: Alignment.center,
                          child: const Text(
                            "Create",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                        Container(
                          height: 40,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            color: Color.fromRGBO(66, 165, 245, 0.7),
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height * 0.86,
              right: MediaQuery.sizeOf(context).width * 0.65,
              child: Image.asset(
                "assets/images/circle.png",
                height: 200,
                width: 200,
              ),
            ),
          ],
        ));
  }
}

class field extends StatefulWidget {
  final String hint;
  final Icon icon;
  final bool obscure;

  field(
      {Key? key,
      TextEditingController? controller,
      required this.hint,
      required this.icon,
      required this.obscure});

  @override
  State<field> createState() => _fieldState();
}

class _fieldState extends State<field> {
  int j = 0;
  int i = 0;
  bool obscure = true;
  void initState() {
    obscure = widget.obscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.obscure) {
      setState(() {
        i = 1;
      });
    }
    return Container(
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
        height: 55,
        width: 250,
        child: Row(
          children: [
            Container(
              width: 200,
              child: TextField(
                controller: _controller,
                onChanged: (value) {
                  recipients.add(value);
                },
                style: TextStyle(color: Colors.white),
                obscureText: [true, false][j],
                decoration: InputDecoration(
                    border: InputBorder.none,
                    iconColor: Colors.white,
                    icon: widget.icon,
                    hintText: widget.hint,
                    hintStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w200)),
              ),
            ),
            [
              Container(),
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (j == 0) {
                        j = 1;
                      } else {
                        j = 0;
                      }
                    });
                  },
                  icon: [
                    Icon(Icons.remove_red_eye_outlined),
                    Image.asset(
                      "assets/images/eye.png",
                      width: 30,
                      height: 30,
                    ),
                  ][j]),
            ][i]
          ],
        ));
  }
}

class field_otp extends StatefulWidget {
  final String hint;
  final Icon icon;

  field_otp({
    Key? key,
    required this.hint,
    required this.icon,
  });

  @override
  State<field_otp> createState() => _fieldState_otp();
}

class _fieldState_otp extends State<field_otp> {
  int j = 0;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
        height: 55,
        width: 250,
        child: Row(children: [
          Container(
            width: 200,
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.number,
              controller: _otp,
              onChanged: (value) {
                print(otp);
                print(value);
                value.replaceAll(' ', '');
                if (value == otp) {
                  verified = true;
                  otp = '';
                }
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  iconColor: Colors.white,
                  icon: widget.icon,
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w200)),
            ),
          )
        ]));
  }
}

class field_phone extends StatefulWidget {
  final String hint;
  final Icon icon;

  field_phone({
    Key? key,
    required this.hint,
    required this.icon,
  });

  @override
  State<field_phone> createState() => _fieldState_phone();
}

// ignore: camel_case_types
class _fieldState_phone extends State<field_phone> {
  int j = 0;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
        height: 55,
        width: 250,
        child: Row(children: [
          Container(
            width: 200,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _controller,
              onChanged: (value) {
                recipients.add(value);
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  iconColor: Colors.white,
                  icon: widget.icon,
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w200)),
            ),
          )
        ]));
  }
}
