import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stjean_douai_app/components/delayed_animation.dart';
import 'package:stjean_douai_app/main.dart';


class PageAccueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
