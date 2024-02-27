import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:software_engineering_project/Pages/authentification/landing_page.dart";
//Testing
import "package:software_engineering_project/models/user_model.dart";


import "package:software_engineering_project/service/nav_bar.dart";

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

              //TO DO: assign user to userModel and save it across app
              //final firestore = FirebaseFirestore.instance;
              //final FirebaseAuth auth = FirebaseAuth.instance;
              //final User? user = auth.currentUser;
              //final usersCollection = firestore.collection('Users');
              //final tempUser = UserModel.fromUid(uid: user!.uid);

              return const NavBar();
            } else {
              return const LandingPage();
            }
            //user is not logged in
          }),
    );
  }
}
