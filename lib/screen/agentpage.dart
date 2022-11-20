import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ta_ppb/models/agent.api.dart';
import 'package:ta_ppb/models/agent.dart';
import 'package:ta_ppb/screen/agentdetail.dart';
import 'package:ta_ppb/screen/about.dart';
import 'dart:convert';

class AgentPage extends StatefulWidget {
  const AgentPage({Key? key}) : super(key: key);

  @override
  _AgentPageState createState() => _AgentPageState();
}

class _AgentPageState extends State<AgentPage> {
  late List<Agent> _agents;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getAgents();
  }

  Future<void> getAgents() async {
    _agents = await AgentApi.getAgent();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Agents',
          style: TextStyle(
            fontWeight: FontWeight.w700
          ),),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            IconButton(
              onPressed: ()=>Navigator.push(context, 
              MaterialPageRoute(builder: (context)=>AboutPage())), 
              icon: Icon(Icons.question_mark_rounded))],
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator(color: Color(0xAAFD4556),))
            : ListView.builder(
                itemCount: _agents.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                        color: Colors.transparent,
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: Image.network(_agents[index].agent_image.toString(),height: 150,width: 100),
                          title: Text(_agents[index].title.toString()),
                          subtitle: Text(
                              'Role: ${_agents[index].role.toString()}'),
                           onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                        title: _agents[index].title,
                                        description: _agents[index].description,
                                        role: _agents[index].role,
                                        agent_image: _agents[index].agent_image),
                                    
                                  ),

                                );
                              },
                        ),
                      ),
                    ],
                  );
                },
              ));
  }
}
