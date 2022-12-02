import 'dart:convert';
import 'package:ta_ppb/models/weapon.dart';
import 'package:http/http.dart' as http;

class WeaponsApi {
  static Future<List<Weapons>> getWeapons() async {
   final response =
      await http.get(Uri.parse('https://valorant-api.com/v1/weapons'));

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['data']) {
      _temp.add(i);
    }

    return Weapons.weaponsFromSnapshot(_temp);
  }
}