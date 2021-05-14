import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marvel_heroes/models/Character.dart';
import 'package:marvel_heroes/widgets/buildBackground.dart';
import 'package:marvel_heroes/widgets/buildBottomNavigationBar.dart';

class HeroDetailsScreen extends StatefulWidget {

  Character hero;

  HeroDetailsScreen({Key key, @required this.hero}) : super(key: key);

  @override
  _HeroDetailsScreenState createState() => _HeroDetailsScreenState(hero);
}

class _HeroDetailsScreenState extends State<HeroDetailsScreen> {
  Character hero;
  
  _HeroDetailsScreenState(@required this.hero);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            buildBackground(), 
            Container(
              
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 40
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    Image(image: NetworkImage(hero.thumbnail['path']+'.'+hero.thumbnail['extension']),
                    height: 450,
                    fit: BoxFit.fill,
                    ),
                  ],
                )

              )
            )
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }
}
