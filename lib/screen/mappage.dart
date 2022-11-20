import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ta_ppb/models/map.api.dart';
import 'package:ta_ppb/models/map.dart';
import 'package:ta_ppb/screen/mapdetail.dart';
import 'package:ta_ppb/screen/about.dart';
import 'dart:convert';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late List<Maps> _maps;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getMaps();
  }

  Future<void> getMaps() async {
    _maps = await MapsApi.getMaps();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Maps',style: TextStyle(
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
                itemCount: _maps.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                        color: Colors.transparent,
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: Image.network(_maps[index].map_image.toString(),height: 100,width: 100,),
                          title: Text(_maps[index].map_name.toString()),
                           onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                        map_name: _maps[index].map_name,
                                        map_description: _maps[index].map_description,
                                        map_image: _maps[index].map_image),
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
