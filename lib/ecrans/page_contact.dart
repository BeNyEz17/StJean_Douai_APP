import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const accentCanvasColor = const Color(0xFF3E3E61);

class PageContact extends StatelessWidget {
  const PageContact({Key? key}) : super(key: key);

  static const pageTitle = 'Contact';

  // Contact email address
  static const contactEmail = 'contact@example.com';

  // Contact phone number
  static const contactPhoneNumber = '+1 555-555-5555';

  // Launch email app with pre-filled email
  _launchEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: contactEmail,
    );

    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Launch phone app with pre-filled phone number
  _launchPhone() async {
    final Uri params = Uri(
      scheme: 'tel',
      path: contactPhoneNumber,
    );

    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _launchEmail,
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
                        Icon(Icons.mail_outline),
                        SizedBox(width: 16.0),
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
                  onPressed: _launchPhone,
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
                        Icon(Icons.phone),
                        SizedBox(width: 16.0),
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