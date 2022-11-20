import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:ta_ppb/screen/home.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/valorant.png',height: 150,),
      logoWidth: 250,
      backgroundColor: Color(0xFF0F1822),
      showLoader: true,
      loadingText: Text("Loading..."),
      loaderColor: Color(0xAAFD4556),
      navigator: HomePage(),
      durationInSeconds: 5,);
  }
}