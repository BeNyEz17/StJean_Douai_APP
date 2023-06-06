import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

const accentCanvasColor = const Color(0xFF3E3E61);

class PageContact extends StatelessWidget {
  const PageContact({Key? key}) : super(key: key);

  static const pageTitle = 'Contact';

  // Contact email address
  static const contactEmail = 'contact@stjean-douai.eu';

  // Contact phone number
  static const contactPhoneNumber = '0327944660';

  // Launch email app with pre-filled email
  _launchEmail(BuildContext context) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: contactEmail,
    );

    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            title: Text(
              'Ouverture de la boîte mail impossible',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Adresse e-mail :',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  contactEmail,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: contactEmail));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Adresse e-mail copiée',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.copy, size: 18.0),
                        SizedBox(width: 8.0),
                        Text('Copier'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    child: Text('Fermer'),
                  ),
                ],
              ),
            ],
          );
        },
      );
    }
  }

  // Launch phone app with pre-filled phone number
  _launchPhone(BuildContext context) async {
    final Uri params = Uri(
      scheme: 'tel',
      path: contactPhoneNumber,
    );

    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            title: Text(
              'Appel impossible',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Numéro de téléphone :',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  contactPhoneNumber,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: contactPhoneNumber));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Numéro de téléphone copié',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.copy, size: 18.0),
                        SizedBox(width: 8.0),
                        Text('Copier'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    child: Text('Fermer'),
                  ),
                ],
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.contact_phone),
            SizedBox(width: 8.0),
            Text(pageTitle),
          ],
        ),
        backgroundColor: accentCanvasColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, accentCanvasColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo2.png',
                width: 200.0,
                height: 200.0,
              ),
              SizedBox(height: 16.0),
              Text(
                'Contact nous',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: accentCanvasColor,
                ),
              ),
              SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _launchEmail(context),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: accentCanvasColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.mail_outline, size: 18.0),
                        SizedBox(width: 8.0),
                        Text(
                          'Envoyer un email',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _launchPhone(context),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: accentCanvasColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.phone, size: 18.0),
                        SizedBox(width: 8.0),
                        Text(
                          'Appeler',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
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
