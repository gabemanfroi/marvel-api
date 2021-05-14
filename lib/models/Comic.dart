class Comic {
  String title;
  //Map<String, String> thumbnail;

  Comic(this.title, /*this.thumbnail*/);

  factory Comic.fromJson(Map<String, dynamic> json) {
    
    /*Map<String, String> thumbnail = {
      "path": json['thumbnail']['path'],
      "extension": json['thumbnail']['extension']
    };*/

    return Comic(
      json['name'] as String,
      /*thumbnail*/
    );
  }
}
