import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ta_ppb/models/weapon.api.dart';
import 'package:ta_ppb/models/weapon.dart';
import 'dart:convert';

class DetailPage extends StatefulWidget {
  final String? displayName;
  final String? category;
  final String? displayIcon;
  final num? cost;
  final num? fireRate;
  final num? magazineSize;
  final num? reloadTimeSeconds;
  const DetailPage({Key? key,this.displayName,this.category,this.displayIcon,this.cost,this.fireRate,this.magazineSize,this.reloadTimeSeconds})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details',
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
                Center(child: Image.network(widget.displayIcon.toString(),cacheHeight: 200,cacheWidth: 300,)),
                SizedBox(height: 20),
                Text(widget.displayName.toString(), style: 
                TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),),
                Text('Category: '+widget.category.toString(), style: 
                TextStyle(
                  fontSize: 16,
                ),),
                SizedBox(height: 20),
                Text('Stats of this Weapon: \nCost: '+widget.cost.toString()+'\nFire Rate: '+widget.fireRate.toString()+'\nMagazine Size: '+widget.magazineSize.toString()+'\nReload Time Second: '+widget.reloadTimeSeconds.toString()),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

