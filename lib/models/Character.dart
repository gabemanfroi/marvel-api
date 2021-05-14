import 'Comic.dart';

class Character {
  final String name;
  final Map<String, String> thumbnail;
  final List<Comic> comics;
  final String description;

  String get heroName => this.name;

  Character(this.name, this.thumbnail, this.description, [this.comics]);

  factory Character.fromJson(dynamic json) {
    Map<String, String> thumbnail = {
      "path": json['thumbnail']['path'].toString().replaceAll('http', 'https'),
      "extension": json['thumbnail']['extension']
    };

    if (json['comics'] != null) {
      var comicsObjJson = json['comics']['items'] as List;
      List<Comic> _comics =
          comicsObjJson.map((comicJson) => Comic.fromJson(comicJson)).toList();
      return Character(
          json['name'] as String, thumbnail, json['description'], _comics);
    } else {
      print(thumbnail);
      return Character(json['name'] as String, thumbnail, json['description']);
    }
  }
}
