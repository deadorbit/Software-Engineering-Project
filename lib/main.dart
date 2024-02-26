import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:software_engineering_project/Pages/authentification/profile_page.dart';
import 'package:software_engineering_project/service/nav_bar.dart';
import 'Pages/authentification/auth_page.dart';
import 'Pages/authentification/landing_page.dart';
import 'Pages/authentification/register_page.dart';
import 'Pages/authentification/login_page.dart';
import 'Pages/browsing_page.dart';
import 'Pages/favorite_page.dart';
import 'Pages/history_page.dart';
import 'firebase_options.dart';

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
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
