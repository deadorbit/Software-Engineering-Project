import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/fav_cards.dart';
import '../components/transactionCard.dart';
import '../models/stock_model.dart';
import '../models/transaction_model.dart';
import '../service/controller.dart';
import "package:firebase_auth/firebase_auth.dart";

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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

  final databaseController = DataBase_Controller();
  String result = "Loading..."; // Initial state of the result
  List<Trans> _transactions = [];
  void getUsers() async {
    if (userId.isNotEmpty) {
      _transactions = await databaseController.getTransactions(userId);
      setState(() {
        // Update UI after fetching stocks
      });
    }
  }

  void onUnFav(String stockCode) {
    setState(() {
      _transactions.removeWhere((stock) => stock.code == stockCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Transaction"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: _transactions.isEmpty
            ? Center(
                child: Text(
                  'No transactions',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'serif',
                  ),
                ),
              )
            : ListView.builder(
                itemCount: _transactions.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      TransactionCard(
                        price: getPriceByCode(_transactions[index].code),
                        stockCode: _transactions[index].code,
                        userId: userId,
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
