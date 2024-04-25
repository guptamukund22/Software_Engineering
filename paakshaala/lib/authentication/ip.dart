import 'dart:io';

Future<InternetAddress> selfIP() async {
  print(InternetAddress.anyIPv4);
  return InternetAddress.anyIPv4;
}
