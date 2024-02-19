import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../service/controller.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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
              Text(
                "To browsing Page",
              ),
              ElevatedButton(
                  child: Text("data"),
                  onPressed: () {
                    getUsers();
                  }),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  child: Text("browsing"),
                  onPressed: () {
                    Navigator.of(context).pushNamed('browsing_page');
                  })
            ],
          ),
        ),
      ),
    );
  }
}
