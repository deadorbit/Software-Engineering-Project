import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../service/controller.dart';

class MyFavCard extends StatefulWidget {
  final String stockCode;
  final String userId;
  final VoidCallback onUnFav;
  final VoidCallback onOpenChart;

  MyFavCard({
    super.key,
    required this.stockCode,
    required this.userId,
    required this.onUnFav,
    required this.onOpenChart,
  });

  @override
  State<MyFavCard> createState() => _MyFavCardState();
}

class _MyFavCardState extends State<MyFavCard> {
  final databaseController = DataBase_Controller();

  String price = "0";

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
      // var resp = await http.get(Uri.parse('https://www.thunderclient.com/welcome'));
      var jsonData = jsonDecode(resp.body);
      var jsonData2 = jsonDecode(jsonData);
      String price1 = jsonData2[0]['Close'].toStringAsFixed(2);
      setState(() {
        price = price1;
      });
    } catch (e) {
      print(e);
    }
  }

  void openChart() {
    widget.onOpenChart();
  }

  void trade() {
    Navigator.pushReplacementNamed(
      context,
      '/trade',
      arguments: {
        'stockCode': widget.stockCode, // Example stock code
        'userId': widget.userId, // Example user ID
        'price': double.parse(price),
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
                    Text('\$${price}',
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
