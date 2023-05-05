import 'package:flutter/material.dart';

import '../components/side_menu.dart';


class PageAccueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Accueil St Jean Douai',
        debugShowCheckedModeBanner: false,
        home: Sidebar()
    );
  }
}

