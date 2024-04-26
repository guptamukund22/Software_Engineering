import 'package:flutter/material.dart';
import 'package:paakshaala/authentication/login.dart';
import 'package:paakshaala/basic_structure.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Paakshala',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue[300]!),
        useMaterial3: true,
      ),
      home: basic_structure(),
    );
  }
}
