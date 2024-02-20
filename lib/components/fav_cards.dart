import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String stockCode;

  const MyCard({super.key, required this.stockCode});

  void openChart(String stockID) {}
  void tarde(String stockID) {}
  void unFav(String stockID) {}

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Color.fromARGB(255, 204, 136, 0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(stockCode,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
              IconButton(
                onPressed: () {
                  openChart(stockCode);
                },
                icon: Icon(Icons.graphic_eq),
                iconSize: 30,
                color: Color.fromARGB(255, 53, 239, 227),
              ),
              IconButton(
                onPressed: () {
                  tarde(stockCode);
                },
                icon: Icon(Icons.money),
                iconSize: 30,
                color: Color.fromARGB(255, 251, 255, 0),
              ),
              IconButton(
                onPressed: () {
                  unFav(stockCode);
                },
                icon: Icon(Icons.heart_broken),
                iconSize: 30,
                color: Color.fromARGB(255, 222, 18, 18),
              ),
            ]));
  }
}
