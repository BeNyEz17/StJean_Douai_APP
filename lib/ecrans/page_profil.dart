import 'package:flutter/material.dart';

const accentCanvasColor = const Color(0xFF3E3E61);

class PageProfil extends StatelessWidget {
  const PageProfil({Key? key}) : super(key: key);

  static const pageTitle = 'Profil';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fond blanc
      appBar: AppBar(
        title: const Text(pageTitle),
        backgroundColor: accentCanvasColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: accentCanvasColor,
                radius: 64.0,
                backgroundImage: AssetImage('assets/images/Profil.png'),
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Texte en noir
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: Text(
                'john.doe@example.com',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey, // Texte gris
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Informations personnelles',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Texte en noir
              ),
            ),
            SizedBox(height: 8.0),
            ListTile(
              leading: Icon(Icons.date_range, color: Colors.black), // Icône en noir
              title: Text(
                'Date de naissance',
                style: TextStyle(color: Colors.black), // Texte en noir
              ),
              subtitle: Text(
                '01/01/1990',
                style: TextStyle(color: Colors.grey), // Texte gris
              ),
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.black), // Icône en noir
              title: Text(
                'Adresse',
                style: TextStyle(color: Colors.black), // Texte en noir
              ),
              subtitle: Text(
                '123 Rue de l\'Exemple, Ville, Pays',
                style: TextStyle(color: Colors.grey), // Texte gris
              ),
            ),
            // Ajoutez d'autres informations personnelles ici
          ],
        ),
      ),
    );
  }
}
