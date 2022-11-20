import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ta_ppb/models/map.api.dart';
import 'package:ta_ppb/models/map.dart';
import 'dart:convert';

class DetailPage extends StatefulWidget {
  final String? map_name;
  final String? map_description;
  final String? map_image;
  const DetailPage({Key? key,this.map_name,this.map_description,this.map_image})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
                Center(child: Image.network(widget.map_image.toString(),cacheHeight: 200,cacheWidth: 300,)),
                SizedBox(height: 20),
                Text(widget.map_name.toString(), style: 
                TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 20),
                Expanded(child: Text(widget.map_description.toString()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

