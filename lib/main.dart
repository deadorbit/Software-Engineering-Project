import 'package:flutter/material.dart';
import 'package:software_engineering_project/pages/authentification/landing_page.dart';
import 'package:software_engineering_project/pages/authentification/login_page.dart';
import 'package:software_engineering_project/pages/authentification/profile_page.dart';
import 'package:software_engineering_project/pages/authentification/register_page.dart';
import 'package:software_engineering_project/pages/authentification/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/auth', // Set the initial route to LandingPage
      routes: {
        '/landing': (context) => const LandingPage(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/auth': (context) => const AuthPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
