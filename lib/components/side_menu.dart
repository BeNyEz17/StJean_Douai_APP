import 'package:flutter/material.dart';
import 'package:stjean_douai_app/ecrans/page_profil.dart';
import 'drawer_items.dart';
import 'package:stjean_douai_app/ecrans/page_paramatres.dart';
import 'package:stjean_douai_app/ecrans/page_applications.dart';
import 'package:stjean_douai_app/ecrans/page_lieux.dart';
import 'package:stjean_douai_app/ecrans/page_contact.dart';
import 'package:stjean_douai_app/ecrans/page_accueil.dart';

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
      appBar: AppBar(title: Text(title), backgroundColor: accentCanvasColor),
      body: PageAccueil(), // Utilisez PageAccueil() comme contenu de la page d'accueil
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: accentCanvasColor,
              ),
              child: Image.asset('assets/images/Logo.png'),
            ),
            DrawerItem(
              title: 'Accueil',
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PageAccueil()),
                );
              },
            ),
            DrawerItem(
              title: 'Applications',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageApplications()),
                );
              },
            ),
            DrawerItem(
              title: 'Lieux',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PagesLieux()),
                );
              },
            ),
            DrawerItem(
              title: 'Contact',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageContact()),
                );
              },
            ),
            DrawerItem(
              title: 'Profil',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageProfil()),
                );
              },
            ),
            const ListTileDivider(),
            DrawerItem(
              title: 'Parametres',
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
