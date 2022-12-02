import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ta_ppb/models/weapon.api.dart';
import 'package:ta_ppb/models/weapon.dart';
import 'package:ta_ppb/screen/weapondetail.dart';
import 'package:ta_ppb/screen/about.dart';
import 'dart:convert';

class WeaponPage extends StatefulWidget {
  const WeaponPage({Key? key}) : super(key: key);

  @override
  _WeaponPageState createState() => _WeaponPageState();
}

class _WeaponPageState extends State<WeaponPage> {
  late List<Weapons> _weapons;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getWeapons();
  }

  Future<void> getWeapons() async {
    _weapons = await WeaponsApi.getWeapons();
    setState(() {
      _isLoading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weapons',style: TextStyle(
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
        body: FutureBuilder(
          future: getWeapons(),
          builder:(context, snapshot) => _isLoading
              ? Center(child: CircularProgressIndicator(color: Color(0xAAFD4556),))
              : ListView.builder(
                  itemCount: _weapons.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Card(
                          color: Colors.transparent,
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            leading: Image.network(_weapons[index].displayIcon.toString(),height: 100,width: 100,),
                            title: Text(_weapons[index].displayName.toString()),
                             onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                          displayName: _weapons[index].displayName,
                                          category: _weapons[index].category.toString() ,
                                          displayIcon: _weapons[index].displayIcon,
                                          cost: _weapons[index].cost ,
                                          fireRate: _weapons[index].cost ,
                                          magazineSize: _weapons[index].cost ,
                                          reloadTimeSeconds: _weapons[index].cost ),
                                    ),
        
                                  );
                                },
                          ),
                        ),
                      ],
                    );
                  },
                ),
          
        ));
  }
}
