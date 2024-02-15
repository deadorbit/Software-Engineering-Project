import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BrowsingPage extends StatefulWidget {
  const BrowsingPage({super.key});

  @override
  State<BrowsingPage> createState() => _BrowsingPageState();
}

class _BrowsingPageState extends State<BrowsingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("browsing Stock Page"), automaticallyImplyLeading: false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "To other pages",
            ),
            ElevatedButton(
              child: Text("Back to fav"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: Text("to history"),
              onPressed: () {
                Navigator.of(context).pushNamed('history_page');
              },
            )
          ],
        ),
      ),
    );
  }
}
