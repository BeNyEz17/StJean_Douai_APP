import 'package:flutter/material.dart';
import 'package:stjean_douai_app/page_accueil.dart';

const d_black = const Color(0x8A000000);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'St Jean Douai',
      debugShowCheckedModeBanner: false,
      home: PageAccueil()
      );
  }
}

