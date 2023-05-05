import 'package:flutter/material.dart';

const accentCanvasColor = const Color(0xFF3E3E61);

class PageApplications extends StatelessWidget {
  const PageApplications({Key? key}) : super(key: key);

  static const pageTitle = 'Applications';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(pageTitle), backgroundColor: accentCanvasColor,),
      body: const Center(
        child: Text('pages applications ok'),
      ),
    );
  }
}