import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../service/controller.dart';

class MyFavCard extends StatefulWidget {
  final String stockCode;
  final String userId;
  final VoidCallback onUnFav;
  String price;

  MyFavCard(
      {super.key,
      required this.stockCode,
      required this.userId,
      required this.onUnFav,
      required this.price});

  @override
  State<MyFavCard> createState() => _MyFavCardState();
}

class _MyFavCardState extends State<MyFavCard> {
  final databaseController = DataBase_Controller();

  @override
  void initState() {
    super.initState();
    getPrice(); // Fetch the price when the widget is first created
  }

  void getPrice() async {
    var stockCode1 = widget.stockCode;
    try {
      var resp = await http
          .get(Uri.parse('http://10.0.2.2:8000/stock/$stockCode1/time/1d'));
      // var resp = await http.get(Uri.parse('https://www.thunderclient.com/welcome'));
      String trying = resp.toString();
      var jsonData = jsonDecode(resp.body);
      print(jsonData);
      String responseString =
          "[{\"Open\":174.0899963379,\"High\":176.6049957275,\"Low\":173.0299987793,\"Close\":176.0800018311,\"Volume\":54808559,\"Dividends\":0.0,\"Stock Splits\":0.0}]";
      var responseObject = jsonDecode(responseString);
      print(responseObject);
    } catch (e) {
      print(e);
    }
  }

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
