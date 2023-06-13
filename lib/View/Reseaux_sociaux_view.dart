import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const accentCanvasColor = const Color(0xFF3E3E61);

class PageReseaux extends StatefulWidget {
  const PageReseaux({Key? key}) : super(key: key);

  static const pageTitle = 'Réseaux sociaux';

  @override
  _PageReseauxState createState() => _PageReseauxState();
}

class _PageReseauxState extends State<PageReseaux> {
  List<dynamic>? facebookPosts;
  List<dynamic>? youtubeVideos;

  @override
  void initState() {
    super.initState();
    fetchFacebookPosts().then((posts) {
      setState(() {
        facebookPosts = posts;
      });
    }).catchError((error) {
      print('Failed to fetch Facebook posts: $error');
      // Gérer l'erreur de récupération des publications Facebook
      // Afficher un message d'erreur ou prendre d'autres mesures appropriées
    });

    fetchYouTubeVideos().then((videos) {
      setState(() {
        youtubeVideos = videos;
      });
    }).catchError((error) {
      print('Failed to fetch YouTube videos: $error');
      // Gérer l'erreur de récupération des vidéos YouTube
      // Afficher un message d'erreur ou prendre d'autres mesures appropriées
    });
  }

  Future<List<dynamic>> fetchFacebookPosts() async {
    try {
      final response = await http.get(Uri.parse('https://graph.facebook.com/v13.0/{Institution-Saint-Jean-de-Douai/100063656769244/}/feed?access_token={5b28d5aa2056377791c13c1ccc9f8967}'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['data'];
      } else {
        throw Exception('Failed to fetch Facebook posts. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error while fetching Facebook posts: $e');
      throw Exception('Failed to fetch Facebook posts. Error: $e');
    }
  }

  Future<List<dynamic>> fetchYouTubeVideos() async {
    try {
      final response = await http.get(Uri.parse('https://www.googleapis.com/youtube/v3/search?part=snippet&channelId={UCFXhD5khoxxPJgHc_39NjRQ}&maxResults=10&key={AIzaSyCzOmRRHpaUaxWRT8-onMUo0tnpRWoYpWk}'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['items'];
      } else {
        throw Exception('Failed to fetch YouTube videos. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error while fetching YouTube videos: $e');
      throw Exception('Failed to fetch YouTube videos. Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(PageReseaux.pageTitle),
        backgroundColor: accentCanvasColor,
      ),
      body: (facebookPosts == null || youtubeVideos == null)
          ? Center(child: CircularProgressIndicator()) // Afficher un indicateur de progression pendant le chargement des données
          : ListView.builder(
        itemCount: facebookPosts!.length + youtubeVideos!.length,
        itemBuilder: (BuildContext context, int index) {
          if (index < facebookPosts!.length) {
            // Afficher une publication de Facebook
            return ListTile(
              title: Text(facebookPosts![index]['message']),
              subtitle: Text('Facebook'),
            );
          } else {
            // Afficher une vidéo de YouTube
            final youtubeIndex = index - facebookPosts!.length;
            return ListTile(
              title: Text(youtubeVideos![youtubeIndex]['snippet']['title']),
              subtitle: Text('YouTube'),
            );
          }
        },
      ),
    );
  }
}
