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
  List<dynamic> facebookPosts = [];
  List<dynamic> youtubeVideos = [];

  @override
  void initState() {
    super.initState();
    fetchFacebookPosts().then((posts) {
      setState(() {
        facebookPosts = posts;
      });
    });

    fetchYouTubeVideos().then((videos) {
      setState(() {
        youtubeVideos = videos;
      });
    });
  }

  Future<List<dynamic>> fetchFacebookPosts() async {
    final response = await http.get(Uri.parse('https://graph.facebook.com/v13.0/{votre_page_id}/feed?access_token={votre_token_d_acces}'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to fetch Facebook posts');
    }
  }

  Future<List<dynamic>> fetchYouTubeVideos() async {
    final response = await http.get(Uri.parse('https://www.googleapis.com/youtube/v3/search?part=snippet&channelId={votre_channel_id}&maxResults=10&key={votre_cle_d_api}'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['items'];
    } else {
      throw Exception('Failed to fetch YouTube videos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(PageReseaux.pageTitle),
        backgroundColor: accentCanvasColor,
      ),
      body: ListView.builder(
        itemCount: facebookPosts.length + youtubeVideos.length,
        itemBuilder: (BuildContext context, int index) {
          if (index < facebookPosts.length) {
            // Afficher une publication de Facebook
            return ListTile(
              title: Text(facebookPosts[index]['message']),
              subtitle: Text('Facebook'),
            );
          } else {
            // Afficher une vidéo de YouTube
            final youtubeIndex = index - facebookPosts.length;
            return ListTile(
              title: Text(youtubeVideos[youtubeIndex]['snippet']['title']),
              subtitle: Text('YouTube'),
            );
          }
        },
      ),
    );
  }
}
