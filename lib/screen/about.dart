import 'dart:ui';

import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me',
          style: TextStyle(
            fontWeight: FontWeight.w700
          ),),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset('assets/valorant.png',height: 150,width: 250,)
              ),
              SizedBox(height: 20,),
              Center(child: Text('Aplikasi Informasi Game Valorant',style: TextStyle(
                fontWeight: FontWeight.w600
              ),),),
              SizedBox(height: 30,),
              Center(child: Text('Nama: Aplikasi ini berisi informasi tentang game FPS Valorant yang berisi agent dan map dari game Valorant. Aplikasi ini dibuat untuk memenuhi tugas Praktikum PPB',style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16
              ),))
            ]),
        ),
      )
    );
  }
}