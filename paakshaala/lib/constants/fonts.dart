import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getStyle(double fontSize) {
  return GoogleFonts.libreBaskerville(color: Colors.white, fontSize: fontSize);
}

TextStyle gettextStyle(double fontSize) {
  return GoogleFonts.baskervville(color: Colors.white, fontSize: fontSize);
}

Map<String, num> number = {
  'a': 24,
  'b': 3,
  'c': 21,
  'd': 22,
  'e': 23,
  'f': 13,
  'g': 25,
  'h': 1,
  'i': 12,
  'j': 8,
  'k': 14,
  'l': 11,
  'm': 6,
  'n': 9,
  'o': 18,
  'p': 20,
  'q': 10,
  'r': 15,
  's': 17,
  't': 26,
  'u': 2,
  'v': 7,
  'w': 4,
  'x': 5,
  'y': 16,
  'z': 19,
  '@': 27,
  '.': 31,
  '0': 28,
  '1': 30,
  '2': 34,
  '3': 29,
  '4': 35,
  '5': 32,
  '6': 33,
  '7': 31,
  '8': 36,
  '9': 37
};

Map<num, String> setup_decrypt() {
  Map<num, String> char = {};

  var numb = number.keys.toList();
  for (int i = 0; i < numb.length; i++) {
    char[number[numb[i]]!] = numb[i];
  }
  return char;
}
