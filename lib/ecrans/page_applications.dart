import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const accentCanvasColor = const Color(0xFF3E3E61);
const accentColor = const Color(0xFF7070A8);

class PageApplications extends StatelessWidget {
  const PageApplications({Key? key}) : super(key: key);

  static const pageTitle = 'Applications';

  void _openEcoleDirecte(BuildContext context) async {
    final urlScheme = 'ecoledirecte://';
    final playStoreUrl = 'https://play.google.com/store/apps/details?id=com.ecoledirecte.edmobile';

    if (await canLaunch(urlScheme)) {
      await launch(urlScheme);
    } else {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Erreur',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Mon EcoleDirecte n\'est pas installé sur votre téléphone.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    launch(playStoreUrl);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  child: Text('Installer depuis le Play Store'),
                ),
                SizedBox(height: 8.0),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Annuler'),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }


  void _openTurboself(BuildContext context) async {
    final urlScheme = 'tuboself://';
    final playStoreUrl = 'https://play.google.com/store/apps/details?id=com.turboself.myturboself';

    if (await canLaunch(urlScheme)) {
      await launch(urlScheme);
    } else {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Erreur',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'MyTurboself n\'est pas installé sur votre téléphone.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    launch(playStoreUrl);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  child: Text('Installer depuis le Play Store'),
                ),
                SizedBox(height: 8.0),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Annuler'),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  void _openOffice365(BuildContext context) async {
    final urlScheme = 'office365://';
    final playStoreUrl =
        'https://play.google.com/store/apps/details?id=com.microsoft.office.officehubrow';

    if (await canLaunch(urlScheme)) {
      await launch(urlScheme);
    } else {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Erreur',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Microsoft 365 (Office) n\'est pas installé sur votre téléphone.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    launch(playStoreUrl);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  child: Text('Installer depuis le Play Store'),
                ),
                SizedBox(height: 8.0),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Annuler'),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Row(
        children: [
        Icon(Icons.apps),
    SizedBox(width: 8.0),
    Text(pageTitle),
    ],
    ),
    backgroundColor: accentCanvasColor,
    ),
    body: Container(
    width: double.infinity,
    decoration: BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
    accentCanvasColor,
    Colors.white
      ,
    ],
    ),
    ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 50.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 6.0,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Text(
              'Voici vos applications',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 2.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _openEcoleDirecte(context),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: accentCanvasColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/ecoledirecte_logo.png',
                        width: 30,
                        height: 30,
                      ),
                      title: Text(
                        'Mon EcoleDirecte',
                        style: TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,
                          color: accentCanvasColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () => _openTurboself(context),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: accentCanvasColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/turboself_logo.png',
                        width: 30,
                        height: 30,
                      ),
                      title: Text(
                        'MyTurboself',
                        style: TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,
                          color: accentCanvasColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () => _openOffice365(context),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: accentCanvasColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/office365_logo.png',
                        width: 30,
                        height: 30,
                      ),
                      title: Text(
                        'Microsoft 365 (Office)',
                        style: TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,
                          color: accentCanvasColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}