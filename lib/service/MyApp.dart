import 'package:flutter/material.dart';
import 'Pages/favorite_page.dart';
import 'Pages/browsing_page.dart';
import 'package:Pages/history_page.dart';

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
