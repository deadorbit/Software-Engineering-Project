import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:software_engineering_project/main.dart';
import '../service/controller.dart';
import "package:firebase_auth/firebase_auth.dart";

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/landing');
  }

  final databaseController = DataBase_Controller();
  String result = "Loading..."; // Initial state of the result
  void getUsers() async {
    String usersResult = await databaseController.getUsers();
    setState(() {
      result = usersResult; // Update the result with fetched data
    });
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
        title: Center(child: Text("Saved Quotes", textAlign: TextAlign.center)),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("lib/images/background.png"),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  child: Text("data"),
                  onPressed: () {
                    getUsers();
                  }),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
