import 'dart:convert';

import 'package:anime_sensei_app/models/Anime.dart';
import 'package:http/http.dart' as http;

final baseUrl = 'http://192.168.1.3:5000';

Future<List<Anime>> fetchAnime(String tag) async {
  final response = await http.get('${baseUrl}/search?tag=$tag');
  if (response.statusCode == 200) {
    return decodeAnime(response.body);
  } else if (response.statusCode == 404) {
    throw 'Sorry !! Try another';
  } else {
    throw 'Unable to fetch data from the REST API';
  }
}

List<Anime> decodeAnime(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Anime>((json) => Anime.fromJson(json)).toList();
}
