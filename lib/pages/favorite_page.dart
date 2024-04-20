import 'dart:convert';
// import 'dart:ffi';
// import 'package:http/http.dart' as http;

//import for notifications
import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:software_engineering_project/components/charts/chart_display.dart';
import 'package:software_engineering_project/service/nav_bar.dart';
import '../components/fav_cards.dart';
import '../models/stock_model.dart';
import '../service/controller.dart';
import "package:firebase_auth/firebase_auth.dart";

//imports for browsing page
import '../components/my_card.dart';
import 'package:fuzzy/fuzzy.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  String userId = ""; // Initialize as empty string
  List _prices = [];
  List<Stock> _stocks = [];

  //asking for notification permission here because it's the first page the user will land on

  //initializing lists and variables for browsing part
  List _browsingStocks = [];
  final List<String> _matches = [];
  final List<String> _matchedCodes = [];
  final TextEditingController _queryController = TextEditingController();
  bool _isBrowsing = false;
  final List<bool> _favs = [];
  

  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
              title: const Text('Allow Notifications'),
              content:
                  const Text('Our app would like to send you notifications'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Don\'t Allow',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ))),
                TextButton(
                    onPressed: () => AwesomeNotifications()
                        .requestPermissionToSendNotifications()
                        .then((_) => Navigator.pop(context)),
                    child: const Text('Allow',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )))
              ]),
        );
      }
    });

    readJson();
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      setState(() {
        userId = user.uid; // Assign userId if user is logged in
      });
    }

    getUsers(); // Invoke getUsers here or wherever it makes sense after userId is set
  }

  //functions for browsing

  void addToFavourites(String stockName, String stockCode) {
    setState(() {
      Stock stock = Stock(name: stockName, code: stockCode);
      _stocks.add(stock);
      _isBrowsing = false;
      _queryController.clear();
    });

    // print(_isBrowsing);
  }

  Future<void> loadStocks() async {
    final String response =
        await rootBundle.loadString('assets/data/stocks.json');

    final data = await json.decode(response);

    setState(() {
      _browsingStocks = data["stocks"];

      for (var stock in _browsingStocks) {
        // Check if the stock code is present in the list of favorited stocks
        bool isFavorited =
            _stocks.any((favStock) => favStock.code == stock['code']);

        // Add the 'isFavorited' field to the stock map
        stock['isFav'] = isFavorited;
      }

      // print(_browsingStocks);
    });
  }

  void onQueryChanged(String newQuery) {
    loadStocks();

    List<String> stockNames = [];
    // for (var stock in _browsingStocks) {
    //   stockNames.add(stock['name']);
    // }

    setState(() {
      for (var stock in _browsingStocks) {
        stockNames.add(stock['name']);
        _matches.add(stock['name']);
      }
      _isBrowsing = true;
      fuzzySearch(stockNames, newQuery);
    });
  }

  void fuzzySearch(List stocks, String query) {
    if (query.isEmpty) {
      _isBrowsing = false;
      _matches.clear();
      _matchedCodes.clear();
      _favs.clear();
      return;
    }

    double threshold = 1;

    final fuzzy = Fuzzy(stocks,
        options: FuzzyOptions(
          isCaseSensitive: false,
          findAllMatches: true,
          threshold: threshold,
        ));

    final result = fuzzy.search(query);

    //these were in my other code, but if I take them off, what happens?
    _matches.clear();
    _matchedCodes.clear();
    _favs.clear();

    if (query.length == 1) {
      threshold = .99;
    } else if (query.length < 4) {
      threshold = .2;
    } else {
      threshold = 0.01;
    }

    for (var item in result) {
      if (item.score <= threshold) {
        _matches.add(item.item);

        for (var stock in _browsingStocks) {
          if (_matches.contains(stock['name']) &&
              !_matchedCodes.contains(stock['code'])) {
            _matchedCodes.add(stock['code']);
            _favs.add(stock['isFav']);
          }
        }
      }
    }
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/prices.json');

    final data = await json.decode(response);

    setState(() {
      _prices = data["prices"];

      // Used for testing purposes only -- functionality testing
      // print(_stocks);
    });
  }

  // Function to get price by stock code
  String getPriceByCode(String stockCode) {
    // Assuming _prices is already populated with the JSON data
    var priceInfo = _prices.firstWhere(
      (price) => price['code'] == stockCode,
      orElse: () => null,
    );

    if (priceInfo != null) {
      return priceInfo['price']; // Return the price as a String
    } else {
      return 'Not Found'; // Stock code not found
    }
  }

  void signUserOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/landing');
  }

  final databaseController = DataBase_Controller();
  String result = "Loading..."; // Initial state of the result
  void getUsers() async {
    if (userId.isNotEmpty) {
      _stocks = await databaseController.getUserStocksByCustomId(userId);
      setState(() {
        // Update UI after fetching stocks
      });
    }
  }

  void onUnFav(String stockCode) {
    setState(() {
      _stocks.removeWhere((stock) => stock.code == stockCode);
    });
  }

  void onOpenStock(String stockCode) async {
    await showMaterialModalBottomSheet(
      context: context,
      expand: true, // Makes the sheet expand to full height
      backgroundColor:
          Colors.transparent, // Set background color to transparent
      builder: (context) => ChartDisplay(stockTicker: stockCode),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Saved Stocks"),
        actions: [
          IconButton(
            onPressed: () => signUserOut(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
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
                padding: const EdgeInsets.all(20),
                child: TextField(
                    controller: _queryController,
                    onChanged: onQueryChanged,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      hintText: 'Browse stocks...',
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                      ),
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
              _isBrowsing == false
                  ? _stocks.isEmpty
                      ? const Center(
                          child: Text(
                            'No saved quotes. Add some in the Browsing Page',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'serif',
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: _stocks.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  MyFavCard(
                                    stockCode: _stocks[index].code,
                                    userId: userId,
                                    onUnFav: () => setState(() {
                                      onUnFav(_stocks[index].code);
                                    }),
                                    onOpenChart: () => setState(() {
                                      onOpenStock(_stocks[index].code);
                                    }),
                                    navigatorKey: navigatorKey,
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                  : Expanded(
                      child: ListView.builder(
                          itemCount: _matches.length,
                          itemBuilder: (context, index) {
                            return MyCard(
                              addToFavourites: () => setState(() {
                                addToFavourites(
                                    _matches[index], _matchedCodes[index]);
                              }),
                              isFav: _favs[index],
                              userID: userId,
                              stockName: _matches[index],
                              stockCode: _matchedCodes[index],
                            );
                          }))
            ],
          )),
    );
  }
}
