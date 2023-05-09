import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

const accentCanvasColor = const Color(0xFF3E3E61);

class PagesLieux extends StatelessWidget {
  const PagesLieux({Key? key}) : super(key: key);

  static const pageTitle = 'Lieux';
  static const googleMapsUrl = 'https://www.google.com/maps?q=50.369465744099635,3.0860044668324575';

  void _openGoogleMaps(BuildContext context) async {
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erreur'),
          content: Text('Impossible de lancer Google Maps.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
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
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 0.77,
        child: FlutterMap(
          options: MapOptions(
            center: LatLng(50.369465744099635, 3.0860044668324575),
            zoom: 18,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
          ],
          nonRotatedChildren: [
            RichAttributionWidget(
              attributions: [
                TextSourceAttribution(
                  'OpenStreetMap contributors',
                  onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openGoogleMaps(context),
        child: Icon(Icons.map),
        backgroundColor: accentCanvasColor,
      ),
    );
  }
}