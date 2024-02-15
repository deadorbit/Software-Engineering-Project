import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:namer_app/pages/browsing_page.dart';
import 'package:namer_app/pages/favorite_page.dart';
import 'package:namer_app/pages/history_page.dart';
=======

import '../Pages/browsing_page.dart';
import '../Pages/favorite_page.dart';
import '../Pages/history_page.dart';
>>>>>>> 1aa03e231c0c0913e22b30773588e6225e9275ac

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "text",
      theme: ThemeData(
        primaryColor: Colors.cyan,
      ),
      home: FavoritePage(),
      routes: {
        'browsing_page': (context) => const BrowsingPage(),
        'history_page': (context) => const HistoryPage(),
      },
    );
  }
}
