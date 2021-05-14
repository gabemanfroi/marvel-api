import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marvel_heroes/services/heroesService.dart';
import 'package:marvel_heroes/widgets/buildBackground.dart';
import 'package:marvel_heroes/widgets/buildBottomNavigationBar.dart';

import '../heroDetailsScreen/heroDetailsScreen.dart';

class HeroesListScreen extends StatefulWidget {
  @override
  _HeroesListScreenState createState() => _HeroesListScreenState();
}

class _HeroesListScreenState extends State<HeroesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              buildBackground(),
              FutureBuilder<List<dynamic>>(
                future: fetchHeroes(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            key: Key(snapshot.data[index].name),
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HeroDetailsScreen(hero: snapshot.data[index])))
                            },
                            child: BuildListCard(
                                items: snapshot.data, index: index),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    return Text(
                      "${snapshot.error}",
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        
                      ),
                    ) ;
                  }
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  static List getDummyList() {
    List list = List.generate(10, (i) {
      return "Item ${i + 1}";
    });
    return list;
  }
}

class BuildListCard extends StatelessWidget {
  const BuildListCard({
    @required this.index,
    Key key,
    
    @required this.items,
  }) : super(key: key);

  
  final List items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        child: Row(
          children: <Widget>[
            _buildCardImage(imageUrl: (items[index].thumbnail['path']+'.'+items[index].thumbnail['extension']).toString()),
            Container(
              height: 100,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      items[index].name,
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class _buildCardImage extends StatelessWidget {
  const _buildCardImage({
    Key key,
    @required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(imageUrl))),
    );
  }
}
