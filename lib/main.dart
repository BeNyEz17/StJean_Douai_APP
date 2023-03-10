import 'package:flutter/material.dart';
import 'package:stjean_douai_app/%C3%A9crans/page_entrer.dart';

const d_color = const Color(0xFF03A9F4);

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

