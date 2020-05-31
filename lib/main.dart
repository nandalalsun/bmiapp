import 'package:flutter/material.dart';
import 'homepage.dart';

void main() => runApp(MyApp());
Color theme = Colors.white;
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI Calculator",
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}