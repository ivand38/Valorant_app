import 'package:flutter/material.dart';
import 'package:ta_ppb/screen/home.dart';
import 'package:ta_ppb/screen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime app',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F1822),
        fontFamily: 'Plus Jakarta Sans',
      ),
      home: SplashScreenPage(),
    );
  }
}
