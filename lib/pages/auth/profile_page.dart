import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/landing');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => signUserOut(context), // Pass context here
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text("Logged In As: ${user.email!}"),
      ),
    );
  }
}
