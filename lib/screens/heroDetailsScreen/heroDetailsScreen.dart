import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marvel_heroes/widgets/buildBackground.dart';
import 'package:marvel_heroes/widgets/buildBottomNavigationBar.dart';

class HeroDetailsScreen extends StatefulWidget {
  @override
  _HeroDetailsScreenState createState() => _HeroDetailsScreenState();
}

class _HeroDetailsScreenState extends State<HeroDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            buildBackground(),
            
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }
}