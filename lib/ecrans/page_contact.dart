import 'package:flutter/material.dart';

const accentCanvasColor = const Color(0xFF3E3E61);

class PageContact extends StatelessWidget {
  const PageContact({Key? key}) : super(key: key);

  static const pageTitle = 'Contact';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(pageTitle), backgroundColor: accentCanvasColor,),
      body: const Center(
        child: Text('pages contact ok'),
      ),
    );
  }
}