import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stjean_douai_app/components/delayed_animation.dart';
import 'package:stjean_douai_app/main.dart';

import '../components/side_menu.dart';


class PageAccueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Accueil St Jean Douai',
        debugShowCheckedModeBanner: false,
        home: const SideMenu()
    );
  }
}
