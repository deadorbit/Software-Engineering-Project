import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../service/controller.dart';

class TransactionCard extends StatefulWidget {
  final String stockCode;
  final String userId;
  final String price;

  TransactionCard({
    super.key,
    required this.stockCode,
    required this.userId,
    required this.price,
  });

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  final databaseController = DataBase_Controller();

  void closeTrade() {}

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
            Column(
              mainAxisSize:
                  MainAxisSize.min, // Set the main axis size to minimum
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Align items to the end
              children: [
                Text(
                  'Amount',
                  style: TextStyle(
                    fontSize: 16, // Adjusted for visual hierarchy
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '\$${widget.price}', // Assuming this represents the profit value
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 25,
            ),
            // Column for profit label and value
            Column(
              mainAxisSize:
                  MainAxisSize.min, // Set the main axis size to minimum
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Align items to the end
              children: [
                Text(
                  'Profit',
                  style: TextStyle(
                    fontSize: 16, // Adjusted for visual hierarchy
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '0', // Assuming this represents the profit value
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            ElevatedButton(
              onPressed: closeTrade,
              child: Text(
                "CLOSE",
                style: TextStyle(
                  color: Colors.red, // Text color
                  fontWeight: FontWeight.bold, // Text bold
                ),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor:
                    Colors.red, // Text color when using foregroundColor
                backgroundColor: Colors.white, // Button background color
                textStyle: TextStyle(
                  fontWeight: FontWeight
                      .bold, // Ensures any text in this button is bold
                ),
                side: BorderSide(
                    color: Colors.red, width: 3), // Border color and width
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Slightly rounded corners
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
