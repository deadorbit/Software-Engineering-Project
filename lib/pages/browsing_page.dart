import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/my_card.dart';
import 'package:fuzzy/fuzzy.dart';
import '../service/controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BrowsingPage extends StatefulWidget {
  const BrowsingPage({super.key});

  @override
  State<BrowsingPage> createState() => _BrowsingPageState();
}

class _BrowsingPageState extends State<BrowsingPage> {
  List _stocks = [];
  final List<String> _matches = [];
  final List<String> _matchedCodes = [];

  final TextEditingController _queryController = TextEditingController();

  String userID = '';
  List _currentFav = [];
  final db = DataBase_Controller();

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      setState(() {
        userID = user.uid;
      });
      getCurrentFav();
    }
  }

  void getCurrentFav() async {
    if (userID.isNotEmpty) {
      _currentFav = await db.getUserStocksByCustomId(userID);
      setState(() {});
    }
  }

  void addToFavourites(String stockName, String stockCode) {}

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

  void onQueryChanged(String newQuery) {
    readJson();

    List<String> stockNames = [];
    for (var stock in _stocks) {
      stockNames.add(stock['name']);
    }

    setState(() {
      fuzzySearch(stockNames, newQuery);
    });
  }

  void fuzzySearch(List stocks, String query) {
    if (query.isEmpty) {
      _matches.clear();
      _matchedCodes.clear();
      return;
    }

    double threshold = 0.8;
    final fuzzy = Fuzzy(stocks,
        options: FuzzyOptions(
          isCaseSensitive: false,
          findAllMatches: true,
          matchAllTokens: true,
        ));
    final result = fuzzy.search(query);

    _matches.clear();
    _matchedCodes.clear();

    //without these, the match is more broad, so even with a complete name, there might be other results added to the display.
    //however, the top search will always be the first one

    if (query.length == 1) {
      threshold = 0.8;
    } else if (query.length < 4) {
      threshold = 0.2;
    } else {
      threshold = .01;
    }

    // TESTING PURPOSES: areresults of the function call
    // print("The results : $result");

    // For each item in the array, if the score is less than 0.01, print it
    for (var item in result) {
      if (item.score <= threshold) {
        _matches.add(item.item);

        //adding the codes that match the stocks that are being displayed
        for (var stock in _stocks) {
          if (_matches.contains(stock['name']) &&
              !_matchedCodes.contains(stock['code'])) {
            _matchedCodes.add(stock['code']);

            //TESTING PURPOSES: check if the codes are being matched correctly with stocks currently being searched
            // print(_matchedCodes);
          }
        }

        //TESTING PURPOSES: check if they're being added to the array correctly
        //print(_matches);

        // TESTING PURPOSES: return of item.item
        // return item.item;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            child: TextField(
                controller: _queryController,
                onChanged: onQueryChanged,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                        color: Color.fromARGB(255, 204, 136, 0),
                      )),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 204, 136, 0),
                  ),
                )),
          ),
          _matches.isEmpty
              ? const Center(
                  child: Text(
                  'Heart a Stock to add it to Favourites Page',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontFamily: 'serif'),
                ))
              : Expanded(
                  child: ListView.builder(
                    itemCount: _matches.length,
                    itemBuilder: (context, index) {
                      return MyCard(
                        userID: userID,
                        stockName: _matches[index],
                        stockCode: _matchedCodes[index],
                      );
                    },
                  ),
                ),
        ],
      ),
    ));
  }
}
