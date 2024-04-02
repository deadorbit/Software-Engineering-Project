import 'package:flutter/material.dart';
import '../service/controller.dart';

class MyCard extends StatefulWidget {
  final VoidCallback addToFavourites;
  final bool isFav;
  final String userID;
  final String stockName;
  final String stockCode;

  const MyCard(
      {super.key,
      required this.addToFavourites,
      required this.isFav,
      required this.userID,
      required this.stockName,
      required this.stockCode});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final db = DataBase_Controller();
  // bool _isFavorited = false;
  void addToFavourites(String stockName, String stockCode) async {
    //TESTING PURPOSES: make sure that the function is getting the stock name correct, and is working properly
    //print(stockName + " was added to favourites");
    if (widget.userID.isNotEmpty) {
      await db.addAStock(widget.userID, stockName, stockCode);
      widget.addToFavourites();
    }
    setState(() {
      // _isFavorited = true;
      widget.addToFavourites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 1),
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
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.stockCode,
              ),
              IconButton(
                onPressed: () {
                  addToFavourites(widget.stockName, widget.stockCode);
                },
                icon: (widget.isFav
                    ? const Icon(Icons.heart_broken)
                    : const Icon(Icons.heart_broken_outlined)),
                color: const Color.fromARGB(255, 204, 136, 0),
              )
            ]));
  }
}
