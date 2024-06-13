import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/screens/follow/search_follow_screen.dart';
import 'package:flutter_template/presentation/screens/home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "MecaniXpert",
                style: TextStyle(
                    foreground: Paint()..shader = linearGradient2,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Para tu vehiculo",
                style: TextStyle(
                    foreground: Paint()..shader = linearGradient1,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 2,
              ),
              Image.asset(
                "assets/images/welcome.png",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23.0),
                  gradient: const LinearGradient(colors: [
                    Color(0xFFFF1000),
                    Color(0xFF2508FF),
                  ], begin: Alignment.centerRight, end: Alignment.centerLeft),
                ),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: MaterialButton(
                  elevation: 0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  color: Colors.transparent,
                  child: const Text(
                    "Calcular Precio",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23.0),
                  gradient: const LinearGradient(colors: [
                    Color(0xFFFF1000),
                    Color(0xFF2508FF),
                  ], begin: Alignment.centerRight, end: Alignment.centerLeft),
                ),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: MaterialButton(
                  elevation: 0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchFollowScreen(),
                      ),
                    );
                  },
                  color: Colors.transparent,
                  child: const Text(
                    "Seguimiento",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
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

final Shader linearGradient1 = const LinearGradient(
  colors: <Color>[Color(0xFFFF1000), Color(0xFF2508FF)],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
final Shader linearGradient2 = const LinearGradient(
  colors: <Color>[Color(0xFF2508FF), Color(0xFFFF1000)],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
