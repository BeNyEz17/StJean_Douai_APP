import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stjean_douai_app/components/delayed_animation.dart';
import 'package:stjean_douai_app/main.dart';

import 'connexion.dart';

const d_white = const Color(0xFFEDECF2);

class PageAccueil extends StatelessWidget {
  const PageAccueil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: d_white,
      body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: 60,
              horizontal: 30,
          ),
            child: Column(
              children: [DelayedAnimation(
                delay: 1500, 
                child: Container(
                  margin: const EdgeInsets.only(top: 90.0),
                  height: 300,
                  child: Image.asset('images/logo2.png'),
                ),
              ),
                DelayedAnimation(
                  delay: 2500,
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.only(),
                    child: Text("Pour en savoir plus sur ST Jean clique sur le bouton",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize:16,
                    )),
                  ),
                ),
                DelayedAnimation(
                  delay: 3500,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: d_color,
                        shape: StadiumBorder(),
                        padding: EdgeInsets.all(13)),
                      child: Text('Ouvrir'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageConnexion(),
                        ),
                      );
                    },
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
