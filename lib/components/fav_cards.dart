import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../pages/trading_page.dart';
import '../service/controller.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MyFavCard extends StatefulWidget {
  final String stockCode;
  final String userId;
  final VoidCallback onUnFav;
  final VoidCallback onOpenChart;
  final GlobalKey<NavigatorState> navigatorKey;

  MyFavCard({
    super.key,
    required this.stockCode,
    required this.userId,
    required this.onUnFav,
    required this.onOpenChart,
    required this.navigatorKey,
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
      String price1 = jsonData[0]['Close'].toStringAsFixed(2);
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
    widget.navigatorKey.currentState?.push(MaterialPageRoute(
        builder: (context) => TradingPage(
              stockCode: widget.stockCode,
              userId: widget.userId,
              price: double.parse(price),
            )));
  }

  void unFav() async {
    if (widget.userId.isNotEmpty) {
      await databaseController.deleteStock(widget.userId, widget.stockCode);
      widget.onUnFav();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(widget.stockCode,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('\$$price',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            IconButton(
              hoverColor: Colors.blue,
              onPressed: () {
                openChart();
              },
              icon: const Icon(Icons.add_chart),
              iconSize: 30,
              color: const Color.fromARGB(255, 9, 158, 148),
            ),
            IconButton(
              hoverColor: Colors.yellow,
              onPressed: () {
                trade(); // Fixed typo from "tarde" to "trade"
              },
              icon: const Icon(Icons.account_balance_wallet),
              iconSize: 30,
              color: const Color.fromARGB(255, 203, 133, 2),
            ),
            IconButton(
              onPressed: () {
                unFav();
              },
              hoverColor: const Color.fromARGB(255, 105, 9, 2),
              icon: const Icon(Icons.heart_broken),
              iconSize: 30,
              color: const Color.fromARGB(255, 222, 18, 18),
            ),
          ],
        ),
      ),
    );
  }
}
