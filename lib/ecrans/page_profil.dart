import 'package:flutter/material.dart';

const accentCanvasColor = const Color(0xFF3E3E61);

class PageProfil extends StatelessWidget {
  const PageProfil({Key? key}) : super(key: key);

  static const pageTitle = 'Profil';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(pageTitle), backgroundColor: accentCanvasColor,),
      body: const Center(
        child: Text('page profil ok'),
      ),
    );
  }
}