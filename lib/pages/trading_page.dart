import 'package:flutter/material.dart';
import '../service/controller.dart'; // Make sure this import is correct

class TradinPage extends StatefulWidget {
  final String stockCode;
  final String userId;
  final double price;

  const TradinPage(
      {Key? key,
      required this.stockCode,
      required this.userId,
      required this.price})
      : super(key: key);

  @override
  State<TradinPage> createState() => _TradinPageState();
}

class _TradinPageState extends State<TradinPage> {
  final DataBase_Controller databaseController = DataBase_Controller();
  double balance = 0.0; // Initial balance value
  TextEditingController balanceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch balance asynchronously and update the state
    fetchBalance();
  }

  void fetchBalance() async {
    double userBalance = await databaseController.getUserBalance(widget.userId);
    setState(() {
      balance = userBalance; // Update balance with fetched value
    });
  }

  void placeTrade() {
    double amountOfStock = double.parse(balanceController.text) / widget.price;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // Retrieve the text the that user has entered by using the
          // TextEditingController.
          content: Text(
              "You bought ${amountOfStock.toStringAsFixed(2)} worth of ${widget.stockCode}"),
        );
      },
    );
    balanceController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/nav'),
            icon: const Icon(Icons.logout),
          ),
        ],
        title: Text("Trading Page"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Balance: \$${balance.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            top: 60, // Adjust this value as needed
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Amount of ${widget.stockCode} you want to invest",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      controller: balanceController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter the amount in \$',
                      ),
                    ),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: ElevatedButton(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: Text("Place Trade"),
                        ),
                        onPressed: placeTrade,
                      )),
                  // Add more widgets here as needed
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
