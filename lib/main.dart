import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';
PageController pageController = PageController(initialPage: 0);
int currentIndex = 0;

void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.black,
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}