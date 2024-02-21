import 'package:flutter/material.dart';
import '../components/fav_cards.dart';
import '../models/stock_model.dart';
import '../service/controller.dart';
import "package:firebase_auth/firebase_auth.dart";

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  String userId = ""; // Initialize as empty string

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userId = user.uid; // Assign userId if user is logged in
      });
    }
    getUsers(); // Invoke getUsers here or wherever it makes sense after userId is set
  }

  void signUserOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/landing');
  }

  final databaseController = DataBase_Controller();
  String result = "Loading..."; // Initial state of the result
  List<Stock> _stocks = [];
  void getUsers() async {
    if (userId.isNotEmpty) {
      _stocks = await databaseController.getUserStocksByCustomId(userId);
      setState(() {
        // Update UI after fetching stocks
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => signUserOut(context),
            icon: const Icon(Icons.logout),
          ),
        ],
        title: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text("Saved Quotes"),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: _stocks.isEmpty
            ? Center(
                child: Text(
                  'Heart a Stock to add it to Favourites Page',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'serif',
                  ),
                ),
              )
            : ListView.builder(
                itemCount: _stocks.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      MyFavCard(
                        stockCode: _stocks[index].code,
                        price: _stocks[index].price,
                        userId: userId,
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  );
                },
              ),
      ),
    );
  }
}
