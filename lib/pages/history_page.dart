import 'package:flutter/material.dart';
import '../components/transactionCard.dart';
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
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userId = user.uid; // Assign userId if user is logged in
      });
    }
    getTransactions(); // Invoke getUsers here or wherever it makes sense after userId is set
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

  void onClose() {
    getTransactions();
  }

  final databaseController = DataBase_Controller();
  String result = "Loading..."; // Initial state of the result
  List<Trans> _transactions = [];
  void getTransactions() async {
    if (userId.isNotEmpty) {
      var updatedTransactions =
          await databaseController.getTransactions(userId);
      setState(() {
        _transactions =
            updatedTransactions; // This will refresh the UI with the updated list
      });
    }
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
                        onClose: onClose,
                        open: _transactions[index].open,
                        profitClosed: _transactions[index].profit,
                        priceBought: _transactions[index].priceBought,
                        stockCode: _transactions[index].code,
                        userId: userId,
                        amountDollar: _transactions[index].dollarAmount,
                        amountStock: _transactions[index].stockAmount,
                        transId: _transactions[index].ID,
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
