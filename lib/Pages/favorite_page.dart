import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite 1 Stock page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "To browsing Page",
            ),
            ElevatedButton(
                child: Text("Click me"),
                onPressed: () {
                  Navigator.of(context).pushNamed('browsing_page');
                })
          ],
        ),
      ),
    );
  }
}
