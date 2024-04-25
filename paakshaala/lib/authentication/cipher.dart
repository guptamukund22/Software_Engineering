import 'dart:math';

import 'package:paakshaala/constants/fonts.dart';

int encrypt(String user, String otp) {
  int i = 1;

  for (int j = 0; j < user.length; j++) {
    i = i + number[user[j].toLowerCase()]!.toInt();
  }
  for (int j = 0; j < otp.length; j++) {
    i = (i / pow(2, number[otp[j].toLowerCase()]!.toInt())) as int;
  }
  return i;
}

String decrypt(int i) {
  String message = '';
  var de = setup_decrypt();
  while (i != 1) {
    message += de[i ~/ 2]!;
    i = i % 2;
  }
  return message;
}
