import 'dart:convert';
import 'package:ta_ppb/models/agent.dart';
import 'package:http/http.dart' as http;

class AgentApi {
  static Future<List<Agent>> getAgent() async {
    var uri = Uri.https('valorant-agents-maps-arsenal.p.rapidapi.com', '/agents/en-us',
        {"lang": "en-us"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "b315a41b0emshb7279c096dc67d3p15a0b3jsnffecf6387a14",
      "x-rapidapi-host": "valorant-agents-maps-arsenal.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['agents']) {
      _temp.add(i);
    }

    return Agent.agentsFromSnapshot(_temp);
  }
}