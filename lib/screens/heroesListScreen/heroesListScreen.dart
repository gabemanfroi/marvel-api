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
  List items = getDummyList();
  final imageUrl =
      "https://is2-ssl.mzstatic.com/image/thumb/Video2/v4/e1/69/8b/e1698bc0-c23d-2424-40b7-527864c94a8e/pr_source.lsr/268x0w.png";
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
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            key: Key(items[index]),
                            onTap: () => {print('On Tap Works!')},
                            onDoubleTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HeroDetailsScreen()));
                            },
                            child: BuildListCard(
                                imageUrl: imageUrl, items: items, index: index),
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
    @required this.imageUrl,
    @required this.items,
  }) : super(key: key);

  final String imageUrl;
  final List items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        child: Row(
          children: <Widget>[
            _buildCardImage(imageUrl: imageUrl),
            Container(
              height: 100,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      items[index],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                      child: Container(
                        width: 30,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.teal),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Text(
                          "3D",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                      child: Container(
                          width: 260,
                          child: Text(
                              "His genius finally recognized by his idol Chester",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 48, 48, 54)))),
                    )
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
