import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stjean_douai_app/ViewModel/Actualite_view_model.dart';

class PageAccueil extends StatefulWidget {
  @override
  _PageAccueilState createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  ScrollController _scrollController = ScrollController();
  List<Actualite> actualites = [];
  bool isLoading = false;
  bool reachedEnd = false;

  ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreItems);
    _fetchActualites();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreItems() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !isLoading && !reachedEnd) {
      // Utilisez le délai pour éviter les appels redondants
      Timer(Duration(milliseconds: 200), () {
        _fetchActualites();
      });
    }
  }

  Future<void> _fetchActualites() async {
    setState(() {
      isLoading = true;
    });

    try {
      List<Actualite> fetchedActualites = await _apiService.fetchActualites();

      setState(() {
        actualites.addAll(fetchedActualites);
        isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: _scrollController,
        itemCount: actualites.length + 1,
        itemBuilder: (context, index) {
          if (index < actualites.length) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/Image_introuvable.png',
                      image: actualites[index].image,
                      fit: BoxFit.cover,
                      width: 100.0,
                      height: 100.0,
                      imageErrorBuilder: (context, error, stackTrace) {
                        // Gestionnaire d'erreur pour l'image
                        print('Image Error: $error');
                        return Image.asset(
                          'assets/images/Image_introuvable.png',
                          fit: BoxFit.cover,
                          width: 100.0,
                          height: 100.0,
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          actualites[index].titre,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          actualites[index].date.toString().split(' ')[0], // Affiche uniquement la date
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          actualites[index].description,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (isLoading) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: CircularProgressIndicator()),
            );
          } else {
            reachedEnd = true;
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: Text('Fin des actualitées')),
            );
          }
        },
      ),
    );
  }
}
