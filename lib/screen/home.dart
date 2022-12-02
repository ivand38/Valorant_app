import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ta_ppb/models/agent.api.dart';
import 'package:ta_ppb/models/agent.dart';
import 'package:ta_ppb/screen/agentdetail.dart';
import 'package:ta_ppb/screen/agentpage.dart';
import 'package:ta_ppb/models/weapon.api.dart';
import 'package:ta_ppb/models/weapon.dart';
import 'package:ta_ppb/screen/weaponpage.dart';
import 'package:ta_ppb/screen/weapondetail.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Agent> _agents;
  bool _isLoading = true;
  int currentIndex = 0;
  final screens = [AgentPage(),WeaponPage()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            selectedItemColor: Color(0xAAFD4556),
            backgroundColor: Colors.transparent,
            onTap: (index) => setState(() => currentIndex = index),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Agent'),
              BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Weapon')
            ]));
  }
}
