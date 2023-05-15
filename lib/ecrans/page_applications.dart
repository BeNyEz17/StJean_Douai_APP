import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const accentCanvasColor = const Color(0xFF3E3E61);

class PageApplications extends StatelessWidget {
  const PageApplications({Key? key}) : super(key: key);

  static const pageTitle = 'Applications';

  void _openEcoleDirecte(BuildContext context) async {
    final urlScheme = 'ecoledirecte://'; // Remplacez par le bon schéma d'URL pour "Mon EcoleDirecte"
    final playStoreUrl = 'https://play.google.com/store/apps/details?id=com.ecoledirecte.edmobile';

    if (await canLaunch(urlScheme)) {
      await launch(urlScheme);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erreur'),
          content: Text('Mon EcoleDirecte n\'est pas installé sur votre téléphone.'),
          actions: [
            TextButton(
              onPressed: () {
                launch(playStoreUrl);
                Navigator.pop(context);
              },
              child: Text('Installer depuis le Play Store'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Annuler'),
            ),
          ],
        ),
      );
    }
  }

  void _openTurboself(BuildContext context) async {
    final urlScheme = 'tuboself://'; // Remplacez par le bon schéma d'URL pour "MyTurboself"
    final playStoreUrl = 'https://play.google.com/store/apps/details?id=com.turboself.myturboself';

    if (await canLaunch(urlScheme)) {
      await launch(urlScheme);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erreur'),
          content: Text('MyTurboself n\'est pas installé sur votre téléphone.'),
          actions: [
            TextButton(
              onPressed: () {
                launch(playStoreUrl);
                Navigator.pop(context);
              },
              child: Text('Installer depuis le Play Store'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Annuler'),
            ),
          ],
        ),
      );
    }
  }

  void _openOffice365(BuildContext context) async {
    final urlScheme = 'office365://'; // Remplacez par le bon schéma d'URL pour "Microsoft 365 (Office)"
    final playStoreUrl = 'https://play.google.com/store/apps/details?id=com.microsoft.office.officehubrow';

    if (await canLaunch(urlScheme)) {
      await launch(urlScheme);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erreur'),
          content: Text('Microsoft 365 (Office) n\'est pas installé sur votre téléphone.'),
          actions: [
            TextButton(
              onPressed: () {
                launch(playStoreUrl);
                Navigator.pop(context);
              },
              child: Text('Installer depuis le Play Store'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Annuler'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(pageTitle),
        backgroundColor: accentCanvasColor,
      ),
      body: Column(
        children: [
          ListTile(
            leading: Image.asset(
              'assets/images/ecoledirecte_logo.png',
              width: 32, // Ajustez la taille du logo selon vos besoins
              height: 32,
            ),
            title: Text('Mon EcoleDirecte'),
            onTap: () => _openEcoleDirecte(context),
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/turboself_logo.png',
              width: 32, // Ajustez la taille du logo selon vos besoins
              height: 32,
            ),
            title: Text('MyTurboself'),
            onTap: () => _openTurboself(context),
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/office365_logo.png',
              width: 32, // Ajustez la taille du logo selon vos besoins
              height: 32,
            ),
            title: Text('Microsoft 365 (Office)'),
            onTap: () => _openOffice365(context),
          ),
        ],
      ),
    );
  }
}