import 'dart:convert';
import 'package:ta_ppb/models/map.dart';
import 'package:http/http.dart' as http;

class MapsApi {
  static Future<List<Maps>> getMaps() async {
    var uri = Uri.https('valorant-agents-maps-arsenal.p.rapidapi.com', '/maps/en-us',
        {"lang": "en-us"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "b315a41b0emshb7279c096dc67d3p15a0b3jsnffecf6387a14",
      "x-rapidapi-host": "valorant-agents-maps-arsenal.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['maps']) {
      _temp.add(i);
    }

    return Maps.mapsFromSnapshot(_temp);
  }
}