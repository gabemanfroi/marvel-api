import 'package:flutter/material.dart';
import 'package:marvel_heroes/screens/heroesListScreen/heroesListScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel Heroes API',
      debugShowCheckedModeBanner: false,
      home: HeroesListScreen(),
    );
  }
}