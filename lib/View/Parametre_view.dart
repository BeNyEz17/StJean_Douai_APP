import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

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
            leading: Icon(Icons.notifications, color: accentCanvasColor),
            trailing: Icon(Icons.arrow_forward_ios, color: accentCanvasColor),
            onTap: () {
              openNotificationSettings();
            },
          ),
          ListTile(
            title: Text('Mes informations'),
            subtitle: Text('Accéder www.stjean-douai.eu'),
            leading: Icon(Icons.person, color: accentCanvasColor),
            trailing: Icon(Icons.arrow_forward_ios, color: accentCanvasColor),
            onTap: () {
              launchWebsite('https://www.stjean-douai.eu/');
            },
          ),
        ],
      ),
    );
  }

  void openNotificationSettings() {
    const platform = MethodChannel('channel/notification_settings');
    platform.invokeMethod('openNotificationSettings');
  }

  Future<void> launchWebsite(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Impossible de lancer le site $url';
    }
  }
}
