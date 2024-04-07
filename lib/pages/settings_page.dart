// import 'dart:ffi';
// import 'package:http/http.dart' as http;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:software_engineering_project/pages/portfolio.dart';
import 'package:software_engineering_project/service/nav_bar.dart';

import '../service/controller.dart';
import 'auth/landing_page.dart';
import '../notifications.dart';
import '../utilities.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final databaseController = DataBase_Controller();
  String userId = '';
  Map<String, double> dataMap = {};

  void goToPort() async {
    await data(); // Ensure data is fetched before navigating
    if (navigatorKey.currentState != null) {
      navigatorKey.currentState!.push(MaterialPageRoute(
        builder: (context) => PortfolioPage(
          userId: userId,
          dataMap: dataMap,
        ),
      ));
    }
  }

  Future<void> data() async {
    dataMap = await databaseController.getDataForChart(userId);
    setState(() {
      // This will trigger a rebuild with the updated dataMap
    });
  }

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    data();

    if (user != null) {
      setState(() {
        userId = user.uid; // Assign userId if user is logged in
        dataMap = dataMap;
      });
    }
  }

  void signUserOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut(); // Ensure sign out completes
    // Instead of using Navigator.pushReplacementNamed, consider clearing all routes and pushing the landing page
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LandingPage()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => signUserOut(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        // Wrap the button with a Center widget
        child: ElevatedButton(
          onPressed: goToPort,
          child: Text("Go"),
        ),
      ),
    );
  }
}
