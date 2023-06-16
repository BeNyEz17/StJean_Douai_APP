import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stjean_douai_app/components/Delay_animation.dart';
import 'package:stjean_douai_app/components/Side_menu.dart';
import 'package:stjean_douai_app/ViewModel/User_view_model.dart';

const accentCanvasColor = const Color(0xFF3E3E61);

class PageConnexion extends StatefulWidget {
  @override
  _PageConnexionState createState() => _PageConnexionState();
}

class _PageConnexionState extends State<PageConnexion> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  ApiUserService _userViewModel = ApiUserService();

  void _performLogin() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    bool loginSuccessful = await _userViewModel.login(email, password) == true;

    if (loginSuccessful) {
      // Connexion réussie, redirigez l'utilisateur vers la page d'accueil
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(title: 'Accueil'),
        ),
      );
    } else {
      // Afficher un message d'erreur si la connexion a échoué
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erreur de connexion'),
            content: Text('Vérifiez vos informations de connexion.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DelayedAnimation(
                    delay: 500,
                    child: Text(
                      "Connexion",
                      style: GoogleFonts.poppins(
                        color: accentCanvasColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  DelayedAnimation(
                    delay: 1000,
                    child: Text(
                      "Veuillez vous connecter avec vos informations",
                      style: GoogleFonts.poppins(
                        color: Colors.grey[600],
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            ConnexionForm(
              emailController: _emailController,
              passwordController: _passwordController,
            ),
            SizedBox(height: 90),
            DelayedAnimation(
              delay: 2500,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: accentCanvasColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: 125,
                    vertical: 13,
                  ),
                ),
                child: Text(
                  'CONFIRMER',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: _performLogin,
              ),
            ),
            SizedBox(height: 90),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 35),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(title: 'Accueil'),
                      ),
                    );
                  },
                  child: DelayedAnimation(
                    delay: 3000,
                    child: Text(
                      "PASSER",
                      style: GoogleFonts.poppins(
                        color: accentCanvasColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConnexionForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const ConnexionForm({
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          DelayedAnimation(
            delay: 1500,
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Votre Email',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          DelayedAnimation(
            delay: 2000,
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                labelText: 'Mot de passe',
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
