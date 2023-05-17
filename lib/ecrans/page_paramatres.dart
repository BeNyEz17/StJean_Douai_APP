import 'package:flutter/material.dart';

const accentCanvasColor = const Color(0xFF3E3E61);

class PageParametres extends StatelessWidget {
  const PageParametres({Key? key}) : super(key: key);

  static const pageTitle = 'Paramètres';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(pageTitle),
        backgroundColor: accentCanvasColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Notifications'),
            subtitle: Text('Gérer les paramètres de notification'),
            leading: Icon(Icons.notifications),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Action à effectuer lors du clic sur Notifications
            },
          ),
          ListTile(
            title: Text('Compte'),
            subtitle: Text('Gérer les paramètres du compte'),
            leading: Icon(Icons.account_circle),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Action à effectuer lors du clic sur Compte
            },
          ),
          ListTile(
            title: Text('Confidentialité'),
            subtitle: Text('Gérer les paramètres de confidentialité'),
            leading: Icon(Icons.lock),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Action à effectuer lors du clic sur Confidentialité
            },
          ),
          ListTile(
            title: Text('Langue'),
            subtitle: Text('Changer la langue de l\'application'),
            leading: Icon(Icons.language),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Action à effectuer lors du clic sur Langue
            },
          ),
        ],
      ),
    );
  }
}
