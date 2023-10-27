import 'package:flutter/material.dart';
import 'package:listkuliner/home_page.dart';
import 'package:listkuliner/styles.dart';

// Irham Johar Permana
// A11.2020.12652

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: pageBgColor,
        appBar: AppBar(
          backgroundColor: headerBackColor,
          title: Text(
            "Kuliner Nusantara",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: HomePage(),
      ),
    );
  }
}
