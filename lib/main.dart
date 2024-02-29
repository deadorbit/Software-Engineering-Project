import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:software_engineering_project/service/nav_bar.dart';

import 'firebase_options.dart';
import 'pages/auth/auth_page.dart';
import 'pages/auth/landing_page.dart';
import 'pages/auth/login_page.dart';
import 'pages/auth/register_page.dart';
import 'pages/browsing_page.dart';
import 'pages/favorite_page.dart';
import 'pages/history_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
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
        '/fav': (context) => const FavoritePage(),
        '/browsing': (context) => const BrowsingPage(),
        '/history': (context) => const HistoryPage(),
        '/nav': (context) => const NavBar(),
      },
    );
  }
}
