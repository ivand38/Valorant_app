import 'dart:convert';
import 'package:ta_ppb/models/agent.dart';
import 'package:http/http.dart' as http;

class AgentApi {
  static Future<List<Agent>> getAgent() async {
    var uri = Uri.https('valorant-api.com', '/v1/agents',
        {"isPlayableCharacter": "true"});

    final response = await http.get(uri);

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['data']) {
      _temp.add(i);
    }

    return Agent.agentsFromSnapshot(_temp);
  }
}