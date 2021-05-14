import 'dart:convert';

import 'package:crypto/crypto.dart' as crypto;
import 'package:http/http.dart' as http;
import 'package:marvel_heroes/models/Character.dart';

const baseUrl = "gateway.marvel.com:443";
const publicKey = "ccdb5bf826f9993d66d2220212c59811";
const privateKey = "845194fccf8d22fcb1d82137af9fc8f6333e51ce";
Map<String, dynamic> params = {"apikey": publicKey};
String unencodedPath = '/v1/public/characters';

Future<List<dynamic>> fetchHeroes() async {
  params["ts"] = DateTime.now().millisecondsSinceEpoch.toString();
  params["hash"] = crypto.md5
      .convert(utf8.encode(params['ts'].toString() + privateKey + publicKey))
      .toString();
  try {
    var result = await http.get(Uri.https(baseUrl, unencodedPath, params));
    var heroObjsJson = json.decode(result.body)['data']['results'] as List;

    List<Character> heroObjs =
        heroObjsJson.map((heroJson) => Character.fromJson(heroJson)).toList();
    return heroObjs;
  } catch (Error) {
    print(Error);
  }
  return null;
}
