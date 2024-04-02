import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:software_engineering_project/pages/trading_page.dart';
import 'package:software_engineering_project/service/nav_bar.dart';
import 'pages/auth/auth_page.dart';
import 'pages/auth/landing_page.dart';
import 'pages/auth/register_page.dart';
import 'pages/auth/login_page.dart';
import 'pages/browsing_page.dart';
import 'pages/favorite_page.dart';
import 'pages/history_page.dart';
import 'firebase_options.dart';

//notifications
import 'package:flutter/foundation.dart';

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
      initialRoute: '/auth',
      routes: {
        '/landing': (context) => const LandingPage(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/auth': (context) => const AuthPage(),
        '/fav': (context) => const FavoritePage(),
        '/browsing': (context) => const BrowsingPage(),
        '/history': (context) => const HistoryPage(),
        '/nav': (context) => const NavBar(),
        '/trade': (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return TradingPage(
            stockCode: args['stockCode'],
            userId: args['userId'],
            price: args['price'],
          );
        },
      },
    );
  }
}
