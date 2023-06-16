import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiUserService {
  static const String apiUrl = 'http://192.168.151.93:8000/api/user';

  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return true; // Connexion réussie
    } else if (response.statusCode == 401) {
      return false; // Informations d'identification incorrectes
    } else {
      throw Exception('Failed to login');
    }
  }

  bool passwordVerify(String password, String hashedPassword) {
    // Utiliser password_verify pour comparer les mots de passe
    return password == hashedPassword;
  }
}

class User {
  final String nom;
  final String prenom;
  final String email;
  final String mot_de_passe;
  final String adresse;
  final DateTime date_de_naissance;

  User({
    required this.nom,
    required this.prenom,
    required this.email,
    required this.mot_de_passe,
    required this.adresse,
    required this.date_de_naissance,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nom: json['nom'],
      prenom: json['prenom'],
      email: json['email'],
      mot_de_passe: json['mot_de_passe'],
      adresse: json['adresse'],
      date_de_naissance: DateTime.parse(json['date_de_naissance']),
    );
  }
}