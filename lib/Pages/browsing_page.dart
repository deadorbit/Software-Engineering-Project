import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/my_card.dart';

class BrowsingPage extends StatefulWidget {
  const BrowsingPage({super.key});

  @override
  State<BrowsingPage> createState() => _BrowsingPageState();
}

class _BrowsingPageState extends State<BrowsingPage> {
  List _stocks = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/stocks.json');

    final data = await json.decode(response);
    setState(() {
      _stocks = data["stocks"];
    });
  }

  String query = '';

  void onQueryChanged(String newQuery) {
    readJson();
    setState(() {
      query = newQuery;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('lib/images/background.png'),
        fit: BoxFit.cover,
      )),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            child: TextField(
                onChanged: onQueryChanged,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  hintText: 'Search',
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                        color: Color.fromARGB(255, 204, 136, 0),
                      )),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 204, 136, 0),
                  ),
                )),
          ),
          _stocks.isEmpty
              ? Center(
                  child: Text(
                  'Heart a Stock to add it to Favourites Page',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontFamily: 'serif'),
                ))
              : Expanded(
                  child: ListView.builder(
                      itemCount: _stocks.length,
                      itemBuilder: (context, index) {
                        return MyCard(
                          stockName: _stocks[index]['name'],
                          stockCode: _stocks[index]['code'],
                        );
                      })),
        ],
      ),
    ));
  }
}
