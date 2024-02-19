import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/my_card.dart';
import 'package:fuzzy/fuzzy.dart';

class BrowsingPage extends StatefulWidget {
  const BrowsingPage({super.key});

  @override
  State<BrowsingPage> createState() => _BrowsingPageState();
}

class _BrowsingPageState extends State<BrowsingPage> {
  List _stocks = [];
  List _matches = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/stocks.json');

    final data = await json.decode(response);
    setState(() {
      _stocks = data["stocks"];

      // Used for testing purposes only -- functionality testing
      // print(_stocks);
    });
  }

  String query = '';

  void onQueryChanged(String newQuery) {
    // Reads in JSON file used to display all stocks
    readJson();

    // Extracting the stock names into a new array
    List<String> stockNames = [];
    for (var stock in _stocks) {
      stockNames.add(stock['name']);
    }

    // print (stockNames);

    // Creating the query based on user input in the search box
    setState(() {
      query = newQuery;
      fuzzySearch(stockNames, query);
    });
  }

  // -----------------------------------------------------------------------------
  // IN PROGRESS: Fuzzy search to display partial results during user input process
  void fuzzySearch(List stocks, String query) {
    final fuzzy = Fuzzy(stocks, options: FuzzyOptions(isCaseSensitive: false));
    final result = fuzzy.search(query);

    // TESTING PURPOSES: results of the function call
    // print("The results are: $result");

    // For each item in the array, if the score is less than 0.01, print it
    // TODO: Alter the desired accuracy score as needed
    for (var item in result) {
      if (item.score < 0.2) {
        if (!_matches.contains(item.item)) {
          _matches.add(item.item);
        }
        print(_matches);

        // TESTING PURPOSES: return of item.item
        // return item.item;
      }
    }
    // return "No results";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/background.png'),
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
          _matches.isEmpty
              ? Center(
                  child: Text(
                  'Heart a Stock to add it to Favourites Page',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontFamily: 'serif'),
                ))
              : Expanded(
                  child: ListView.builder(
                      itemCount: _matches.length,
                      // itemCount: fuzzySearch(_stocks, query).length,
                      itemBuilder: (context, index) {
                        return MyCard(
                          // stockName: fuzzySearch(_stocks, query),
                          // stockCode: fuzzySearch(_stocks, query),
                          stockName: _matches[index],
                          // stockName: _stocks[index]['name'],
                          stockCode: _stocks[index]['code'],
                        );
                      })),
        ],
      ),
    ));
  }
}
