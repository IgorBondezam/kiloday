import 'package:flutter/material.dart';
import 'package:kiloday/screns/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static Color green = Colors.green;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: MyApp.green,
          titleTextStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 30),
        ),
      ),
      home: Login(),
    );
  }
}
