import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../service/controller.dart';

class TransactionCard extends StatefulWidget {
  final String stockCode;
  final String userId;
  final double priceBought;
  final double amountStock;
  final double amountDollar;
  final double profit;
  final bool open;
  final String transId;
  final VoidCallback onClose;

  TransactionCard(
      {super.key,
      required this.stockCode,
      required this.userId,
      required this.priceBought,
      required this.amountDollar,
      required this.amountStock,
      required this.open,
      required this.profit,
      required this.transId,
      required this.onClose});

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  final databaseController = DataBase_Controller();
  String currentPrice = "0";
  double profit = 0;

  @override
  void initState() {
    super.initState();
    getPrice(); // Fetch the price when the widget is first created
  }

  void getPrice() async {
    var stockCode1 = widget.stockCode;
    try {
      var resp = await http
          .get(Uri.parse('http://10.0.2.2:5000/stock/$stockCode1/time/1d'));
      var jsonData = jsonDecode(resp.body);
      var jsonData2 = jsonDecode(jsonData);
      double price = jsonData2[0]['Close'];
      String string = price.toStringAsFixed(2);
      double pripeRound = double.parse(string);
      double profit1 = widget.amountStock * (pripeRound - widget.priceBought);
      setState(() {
        currentPrice = string;
        profit = profit1;
      });
    } catch (e) {
      print(e);
    }
  }

  void closeTrade() async {
    double baalce = await databaseController.getUserBalance(widget.userId);
    databaseController.updateUserBalance(widget.userId, baalce + profit);
    databaseController.closeTransaction(widget.userId, profit, widget.transId);
    widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                widget.stockCode,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 10),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Amount',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    '${widget.amountStock.toStringAsFixed(2)}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(width: 10),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Profit',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    '${profit.toStringAsFixed(2)}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: profit == 0.0
                          ? Colors.grey
                          : (profit < 0 ? Colors.red : Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
            widget.open
                ? ElevatedButton(
                    onPressed: closeTrade,
                    child: Text(
                      "CLOSE",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.red,
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.red, width: 3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                : SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
