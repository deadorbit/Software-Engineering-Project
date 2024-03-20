import 'package:flutter/material.dart';
import '../service/controller.dart';

class MyCard extends StatefulWidget {
  final String userID;
  final String stockName;
  final String stockCode;

  const MyCard(
      {super.key,
      required this.userID,
      required this.stockName,
      required this.stockCode});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final db = DataBase_Controller();
  bool _isFavorited = false;
  void addToFavourites(String stockName, String stockCode) async {
    //TESTING PURPOSES: make sure that the function is getting the stock name correct, and is working properly
    //print(stockName + " was added to favourites");
    if (widget.userID.isNotEmpty) {
      await db.addAStock(widget.userID, stockName, stockCode);
    }
    setState(() {
      _isFavorited = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color.fromARGB(255, 204, 136, 0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.stockName,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.stockCode,
              ),
              IconButton(
                onPressed: () {
                  addToFavourites(widget.stockName, widget.stockCode);
                },
                icon: (_isFavorited
                    ? const Icon(Icons.star)
                    : const Icon(Icons.star_border_outlined)),
                color: const Color.fromARGB(255, 204, 136, 0),
              )
            ]));
  }
}
