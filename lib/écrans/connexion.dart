import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stjean_douai_app/components/delayed_animation.dart';
import 'package:stjean_douai_app/main.dart';
import 'package:stjean_douai_app/%C3%A9crans/page_accueil.dart';

class PageConnexion extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DelayedAnimation(
                    delay: 500,
                    child: Text(
                      "Connexion",
                      style: GoogleFonts.poppins(
                        color: d_color,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  DelayedAnimation(
                    delay: 1000,
                    child: Text(
                      "veuillez vous connecter avec vos informations",
                      style: GoogleFonts.poppins(
                        color: Colors.grey[600],
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            ConnexionForm(),
            SizedBox(height: 90),
            DelayedAnimation(
              delay: 2500,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: d_color,
                  padding: EdgeInsets.symmetric(
                    horizontal: 125,
                    vertical: 13,
                  ),
                ),
                child: Text(
                  'CONFIRMER',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 90),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 35),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageAccueil(),
                      ),
                    );
                  },
                  child: DelayedAnimation(
                    delay: 3000,
                    child: Text(
                      "PASSER",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]
          ,
        )
        ,
      )
      ,
    );
  }
}
class ConnexionForm extends StatefulWidget {
  @override
  State<ConnexionForm> createState() => _ConnexionFormState();
}

class _ConnexionFormState extends State<ConnexionForm> {
  var _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          DelayedAnimation(
            delay: 1500,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Votre Email',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          DelayedAnimation(
            delay: 2000,
            child: TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                labelText: 'Mot de passe',
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
