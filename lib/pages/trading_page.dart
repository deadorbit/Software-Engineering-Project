import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../service/controller.dart'; // Confirm this import path is correct

class TradingPage extends StatefulWidget {
  final String stockCode;
  final String userId;
  final double price;

  const TradingPage({
    Key? key,
    required this.stockCode,
    required this.userId,
    required this.price,
  }) : super(key: key);

  @override
  State<TradingPage> createState() => _TradingPageState();
}

class _TradingPageState extends State<TradingPage> {
  final DataBase_Controller databaseController = DataBase_Controller();
  double balance = 0.0; // Initial balance
  TextEditingController balanceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchBalance();
  }

  void fetchBalance() async {
    double userBalance = await databaseController.getUserBalance(widget.userId);
    setState(() => balance = userBalance);
  }

  void depositMoney() async {
    final newBalance = balance + 5000;
    await databaseController.updateUserBalance(widget.userId, newBalance);
    setState(() => balance = newBalance);
  }

  void placeTrade() async {
    final dollarAmount = double.parse(balanceController.text);
    final amountOfStock = dollarAmount / widget.price;

    if (dollarAmount > balance) {
      _showAlertDialog("Not enough balance");
    } else {
      await databaseController.addTrans(widget.userId, widget.stockCode,
          widget.price, dollarAmount, amountOfStock);
      _showAlertDialog(
          "You bought ${amountOfStock.toStringAsFixed(2)} worth of ${widget.stockCode}");
      await databaseController.updateUserBalance(
          widget.userId, balance - dollarAmount);
      setState(() => balance -= dollarAmount);
    }
    balanceController.clear();
  }

  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trading Page"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                "Balance: \$${balance.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: Text("Deposit 5k \$"),
                onPressed: depositMoney,
              ),
              SizedBox(height: 20),
              Text(
                "Current price of ${widget.stockCode} is \$${widget.price}",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 20),
              TextField(
                controller: balanceController,
                decoration: InputDecoration(
                  labelText: 'Amount to Invest in \$',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.attach_money),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'))
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 0, 0, 0),
                  backgroundColor:
                      Colors.green, // Text color (Foreground color)
                  shape: BeveledRectangleBorder(
                    // Shape
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: 30, vertical: 10), // Padding
                ),
                child: Text("Place Trade"),
                onPressed: placeTrade,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
