import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String stockName;
  final String stockCode;

  const MyCard({super.key, required this.stockName, required this.stockCode});

  void addToFavourites(String stockName) {
    print("$stockName was added to favourites");
  }

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
              Text(stockName,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                stockCode,
              ),
              IconButton(
                onPressed: () {
                  // addToFavourites(stockName);
                },
                icon: Icon(Icons.star),
                color: Color.fromARGB(255, 204, 136, 0),
              )
            ]));
  }
}
