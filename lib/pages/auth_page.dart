import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
<<<<<<< Updated upstream:lib/pages/auth_page.dart
import "package:software_engineering_project/pages/landing_page.dart";
import "package:software_engineering_project/pages/profile_page.dart";
=======
import "package:software_engineering_project/Pages/authentification/landing_page.dart";
import "package:software_engineering_project/Pages/authentification/profile_page.dart";
>>>>>>> Stashed changes:lib/Pages/authentification/auth_page.dart

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
              return ProfilePage();
            } else {
              return const LandingPage();
            }
            //user is not logged in
          }),
    );
  }
}
