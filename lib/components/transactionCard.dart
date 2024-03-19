import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../service/controller.dart';

class TransactionCard extends StatefulWidget {
  final String stockCode;
  final String userId;
  final VoidCallback onUnFav;
  final String price;

  TransactionCard(
      {super.key,
      required this.stockCode,
      required this.userId,
      required this.onUnFav,
      required this.price});

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  final databaseController = DataBase_Controller();

  void openChart() {}

  void trade() {
    Navigator.pushReplacementNamed(
      context,
      '/trade',
      arguments: {
        'stockCode': widget.stockCode, // Example stock code
        'userId': widget.userId, // Example user ID
        'price': double.parse(widget.price),
      },
    );
  }

  void unFav() async {
    if (widget.userId.isNotEmpty) {
      await databaseController.deleteStock(widget.userId, widget.stockCode);
      widget.onUnFav();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0), // Add horizontal margin
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color.fromARGB(255, 204, 136, 0),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(widget.stockCode,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('\$${widget.price}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  openChart();
                },
                icon: Icon(Icons.add_chart),
                iconSize: 30,
                color: Color.fromARGB(255, 53, 239, 227),
              ),
              IconButton(
                onPressed: () {
                  trade(); // Fixed typo from "tarde" to "trade"
                },
                icon: Icon(Icons.account_balance_wallet),
                iconSize: 30,
                color: Color.fromARGB(255, 251, 255, 0),
              ),
              IconButton(
                onPressed: () {
                  unFav();
                },
                icon: Icon(Icons.heart_broken),
                iconSize: 30,
                color: Color.fromARGB(255, 222, 18, 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
