import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:software_engineering_project/components/charts/chart_display.dart';
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
  List _prices = [];

  @override
  void initState() {
    super.initState();
    readJson();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userId = user.uid; // Assign userId if user is logged in
      });
    }
    getUsers(); // Invoke getUsers here or wherever it makes sense after userId is set
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/prices.json');

    final data = await json.decode(response);

    setState(() {
      _prices = data["prices"];

      // Used for testing purposes only -- functionality testing
      // print(_stocks);
    });
  }

  // Function to get price by stock code
  String getPriceByCode(String stockCode) {
    // Assuming _prices is already populated with the JSON data
    var priceInfo = _prices.firstWhere(
      (price) => price['code'] == stockCode,
      orElse: () => null,
    );

    if (priceInfo != null) {
      return priceInfo['price']; // Return the price as a String
    } else {
      return 'Not Found'; // Stock code not found
    }
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

  void onUnFav(String stockCode) {
    setState(() {
      _stocks.removeWhere((stock) => stock.code == stockCode);
    });
  }

  void onOpenStock(String stockCode) async {
    await showMaterialModalBottomSheet(
      context: context,
      expand: true, // Makes the sheet expand to full height
      backgroundColor:
          Colors.transparent, // Set background color to transparent
      builder: (context) => ChartDisplay(stockTicker: stockCode),
    );
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
        title: const Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text("Saved Quotes"),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: _stocks.isEmpty
            ? const Center(
                child: Text(
                  'No saved quotes. Add some in the Browsing Page',
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
                        price: getPriceByCode(_stocks[index].code),
                        stockCode: _stocks[index].code,
                        userId: userId,
                        onUnFav: () => setState(() {
                          onUnFav(_stocks[index].code);
                        }),
                        onOpenChart: () => setState(() {
                          onOpenStock(_stocks[index].code);
                        }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
