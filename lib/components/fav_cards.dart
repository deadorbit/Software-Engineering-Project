import 'package:flutter/material.dart';

import '../service/controller.dart';

class MyFavCard extends StatelessWidget {
  final String stockCode;
  final double price;
  final String userId;

  MyFavCard(
      {super.key,
      required this.stockCode,
      required this.price,
      required this.userId});

  final databaseController = DataBase_Controller();

  void openChart() {}
  void trade() {}
  void unFav() async {
    if (userId.isNotEmpty) {
      await databaseController.deleteStock(userId, stockCode);
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
                child: Text(stockCode,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('\$$price',
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
                icon: Icon(Icons.graphic_eq),
                iconSize: 30,
                color: Color.fromARGB(255, 53, 239, 227),
              ),
              IconButton(
                onPressed: () {
                  trade(); // Fixed typo from "tarde" to "trade"
                },
                icon: Icon(Icons.money),
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
