import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:software_engineering_project/Pages/authentification/register_page.dart";
import 'package:software_engineering_project/Pages/favorite_page.dart';
import 'package:software_engineering_project/service/nav_bar.dart';
import "package:software_engineering_project/main.dart";

import "landing_page.dart";

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // user is logged in
            if (snapshot.hasData) {
              return NavBar();
            } else {
              return LandingPage();
            }
            //user is not logged in
          }),
    );
  }
}
