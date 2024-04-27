// ignore_for_file: non_constant_identifier_names, camel_case_types, duplicate_ignore, avoid_print

import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:paakshaala/authentication/User_add.dart';
import 'package:paakshaala/authentication/User_api.dart';
import 'package:paakshaala/authentication/cipher.dart';
import 'package:paakshaala/onboarding/onboard.dart';

//EmailOTP myauth = EmailOTP();

TextEditingController _controller = TextEditingController();
TextEditingController _otp = TextEditingController();
TextEditingController _mailid = TextEditingController();
String otp = '';
bool verified = false;
int otp_write = 0;
String button_text = 'Get OTP';

class Login extends StatefulWidget {
  const Login({super.key});

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
                SizedBox(
                  height: 210,
                  width: MediaQuery.sizeOf(context).width,
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        decoration: const BoxDecoration(
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
                          decoration: const BoxDecoration(
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
                  padding: const EdgeInsets.only(left: 25, bottom: 10),
                  child: const Text("Create Account",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w500)),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 25, bottom: 20),
                  child: const Text("Please enter valid details to continue",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w200)),
                ),
                Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white10,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          const field(
                            hint: "Username",
                            icon: Icon(Icons.person),
                          ),
                          Container(
                            width: 250,
                            height: 5,
                            decoration: const BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(
                                        color: Colors.white10, width: 0.5))),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const field_phone(
                            hint: "Mail",
                            icon: Icon(Icons.mail),
                          ),
                          Container(
                            width: 250,
                            decoration: const BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(
                                        color: Colors.white10, width: 0.5))),
                            height: 5,
                          ),
                          const SizedBox(
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

                                final SmtpServer = gmail(
                                    'recipe.teller.iitj@gmail.com',
                                    "jnbxxfynzzopiwid");
                                final Message message = Message();
                                message.from = const Address(
                                    'recipe.teller.iitj@gmail.com',
                                    'Recipe Teller');
                                print(_mailid.text);
                                message.recipients = [_mailid.text];
                                message.subject = "OTP Verification";
                                message.text =
                                    "Welcome to our App.\n Your OTP is $otp";
                                await send(message, SmtpServer);
                                setState(() {
                                  otp_sent = 1;
                                });

                                Future.delayed(const Duration(seconds: 60));
                                setState(() {
                                  button_text = "Resend OTP";
                                });
                              },
                              child: Text(
                                button_text,
                                style: const TextStyle(fontSize: 20),
                              )),
                          [
                            Container(),
                            const field_otp(
                              hint: "Enter the OTP",
                              icon: Icon(Icons.lock),
                            )
                          ][otp_sent],
                          Container(
                            width: 250,
                            decoration: const BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(
                                        color: Colors.white10, width: 0.5))),
                            height: 5,
                          ),
                          [
                            Container(),
                            const Center(
                              child: SizedBox(
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
                    onTap: () async {
                      if (true) {
                        final String username = _controller.text;
                        final String mailid = _mailid.text;
                        if (username.isEmpty || mailid.isEmpty) {
                        } else {
                          print(otp);
                          int data = encrypt(mailid, otp);
                          print(data);
                          final User user =
                              User(username: username, mailid: data);
                          print(username);
                          print(mailid);
                          UserProvider provider = UserProvider();
                          bool added = await provider.addUser(user);

                          print(added);
                          if (added) {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => onboard()));
                          } else {
                            setState(() {
                              const SnackBar(
                                  content: Text(
                                      "Wrong OTP, please enter valid OTP"));
                              otp_write = 1;
                            });
                          }
                        }
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
                          child: const Icon(
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

  const field({
    super.key,
    TextEditingController? controller,
    required this.hint,
    required this.icon,
  });

  @override
  State<field> createState() => _fieldState();
}

class _fieldState extends State<field> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
        height: 55,
        width: 250,
        child: SizedBox(
          width: 200,
          child: TextField(
            controller: _controller,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                iconColor: Colors.white,
                icon: widget.icon,
                hintText: widget.hint,
                hintStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w200)),
          ),
        ));
  }
}

class field_otp extends StatefulWidget {
  final String hint;
  final Icon icon;

  const field_otp({
    super.key,
    required this.hint,
    required this.icon,
  });

  @override
  State<field_otp> createState() => _fieldState_otp();
}

class _fieldState_otp extends State<field_otp> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
        height: 55,
        width: 250,
        child: Row(children: [
          SizedBox(
            width: 200,
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.number,
              controller: _otp,
              onChanged: (value) {
                value.replaceAll(' ', '');
                if (value == otp) {
                  verified = true;
                  otp = '';
                }
              },
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  iconColor: Colors.white,
                  icon: widget.icon,
                  hintText: widget.hint,
                  hintStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w200)),
            ),
          )
        ]));
  }
}

class field_phone extends StatefulWidget {
  final String hint;
  final Icon icon;

  const field_phone({
    super.key,
    required this.hint,
    required this.icon,
  });

  @override
  State<field_phone> createState() => _fieldState_phone();
}

// ignore: camel_case_types
class _fieldState_phone extends State<field_phone> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
        height: 55,
        width: 250,
        child: Row(children: [
          SizedBox(
            width: 200,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _mailid,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  iconColor: Colors.white,
                  icon: widget.icon,
                  hintText: widget.hint,
                  hintStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w200)),
            ),
          )
        ]));
  }
}
