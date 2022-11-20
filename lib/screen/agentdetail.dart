import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ta_ppb/models/agent.api.dart';
import 'package:ta_ppb/models/agent.dart';
import 'dart:convert';

class DetailPage extends StatefulWidget {
  final String? title;
  final String? description;
  final String? role;
  final String? agent_image;
  const DetailPage({Key? key,this.title,this.description,this.role,this.agent_image})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
        title: const Text('Details',
          style: TextStyle(
            fontWeight: FontWeight.w700
          ),),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,),
      body: _isLoading
      ? Center(child: CircularProgressIndicator(color: Color(0xAAFD4556),))
      : SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.network(widget.agent_image.toString(),cacheHeight: 300,cacheWidth: 200,)),
                SizedBox(height: 20),
                Text(widget.title.toString(), style: 
                TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),),
                Text('Role: '+widget.role.toString()),
                SizedBox(height: 20),
                Expanded(child: Text(widget.description.toString()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

