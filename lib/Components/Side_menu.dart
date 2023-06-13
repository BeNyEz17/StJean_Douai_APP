import 'package:flutter/material.dart';
import 'package:stjean_douai_app/View/Profil_view.dart';
import 'package:stjean_douai_app/View/Parametre_view.dart';
import 'package:stjean_douai_app/View/Applications_view.dart';
import 'package:stjean_douai_app/View/Map_view.dart';
import 'package:stjean_douai_app/View/Contact_view.dart';
import 'package:stjean_douai_app/View/Accueil_view.dart';
import 'package:stjean_douai_app/View/Reseaux_sociaux_view.dart';

void main() {
  runApp(Sidebar());
}

const accentCanvasColor = const Color(0xFF3E3E61);

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key});

  static const appTitle = 'Accueil';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.home), // Ajout de l'icône de maison à côté du titre
            SizedBox(width: 8), // Espacement entre l'icône et le texte
            Text(title),
          ],
        ),
        backgroundColor: accentCanvasColor,
      ),
      body: PageAccueil(), // Utilisez PageAccueil() comme contenu de la page d'accueil
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: accentCanvasColor,
              ),
              child: Column(
                children: [
                  Image.asset('assets/images/Logo.png', width: 130, height: 130), // Ajout du logo dans le DrawerHeader avec des dimensions spécifiées
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.apps, color: accentCanvasColor), // Ajout d'une icône d'application à côté du texte avec la couleur spécifiée
              title: Text('Applications'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageApplications()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: accentCanvasColor), // Ajout d'une icône de lieu à côté du texte avec la couleur spécifiée
              title: Text('Lieux'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PagesLieux()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail, color: accentCanvasColor), // Ajout d'une icône de contact à côté du texte avec la couleur spécifiée
              title: Text('Contact'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageContact()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.share, color: accentCanvasColor), // Ajout d'une icône de contact à côté du texte avec la couleur spécifiée
              title: Text('Réseaux sociaux'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageReseaux()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: accentCanvasColor), // Ajout d'une icône de profil à côté du texte avec la couleur spécifiée
              title: Text('Profil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageProfil()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.settings, color: accentCanvasColor), // Ajout d'une icône de paramètres à côté du texte avec la couleur spécifiée
              title: Text('Parametres'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageParametres()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
