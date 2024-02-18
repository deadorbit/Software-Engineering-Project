import 'package:flutter/material.dart';
import 'Pages/browsing_page.dart';

void main() {
  runApp(MyApp());
}

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
    );
  }
}

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
        title: Text("Favorite Stock page"),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BrowsingPage()),
                  );
                })
          ],
        ),
      ),
    );
  }
}

// class BrowsingPage extends StatefulWidget {
//   const BrowsingPage({super.key});

//   @override
//   State<BrowsingPage> createState() => _BrowsingPageState();
// }

// class _BrowsingPageState extends State<BrowsingPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text("browsing Stock Page"), automaticallyImplyLeading: false),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               "To other pages",
//             ),
//             ElevatedButton(
//               child: Text("Back to fav"),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ElevatedButton(
//               child: Text("to history"),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => HistoryPage()),
//                 );
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Histroy tarde Page"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "To other pages",
            ),
            ElevatedButton(
                child: Text("To browsing"),
                onPressed: () {
                  Navigator.pop(context);
                }),
            ElevatedButton(
                child: Text("To fav"),
                onPressed: () {
                  var nav = Navigator.of(context);
                  nav.pop();
                  nav.pop();
                })
          ],
        ),
      ),
    );
  }
}
