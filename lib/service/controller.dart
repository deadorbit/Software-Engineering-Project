import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:software_engineering_project/models/profit_helper.dart';
import 'package:software_engineering_project/models/transaction_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/profit_at_time.dart';
import '../models/stock_model.dart';
import 'package:intl/intl.dart';

class DataBase_Controller {
  DataBase_Controller();

  List<Stock> favStocks = [];
  List<Trans> trans = [];

  Future<double> getUserBalance(String customUserId) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('Users');

      QuerySnapshot userQuerySnapshot =
          await users.where('userId', isEqualTo: customUserId).get();

      if (userQuerySnapshot.docs.isNotEmpty) {
        var userDocument = userQuerySnapshot.docs.first;
        double balance = userDocument.get('balance');
        return balance;
      } else {
        print("No user with the id");
        return -2;
      }
    } catch (error) {
      print("Failed to retrieve user balance: $error");
      return -2;
    }
  }

  Future<double> getAllTimeProfit(String customUserId) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('Users');

      QuerySnapshot userQuerySnapshot =
          await users.where('userId', isEqualTo: customUserId).get();

      if (userQuerySnapshot.docs.isNotEmpty) {
        var userDocument = userQuerySnapshot.docs.first;
        double profit = userDocument.get('totalProfit');
        return profit;
      } else {
        print("No user with the id");
        return -2;
      }
    } catch (error) {
      print("Failed to retrieve user balance: $error");
      return -2;
    }
  }

  Future<void> updateUserBalance(String customUserId, double value) async {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');

    QuerySnapshot userQuerySnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .where('userId', isEqualTo: customUserId)
        .get();

    if (userQuerySnapshot.docs.isNotEmpty) {
      // Assuming the custom ID is unique and only one document should match
      var userId = userQuerySnapshot.docs.first.id;
      return users
          .doc(userId)
          .update({'balance': value})
          .then((value) => print("balance Updated"))
          .catchError((error) => print("Failed to update balance: $error"));
    } else {
      print("no user with the id");
    }
  }

  Future<List<Stock>> getUserStocksByCustomId(String customUserId) async {
    try {
      // Query the 'Users' collection to find the document with the matching custom ID
      QuerySnapshot userQuerySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('userId', isEqualTo: customUserId)
          .get();

      // Check if a document with the custom ID exists
      if (userQuerySnapshot.docs.isNotEmpty) {
        // Assuming the custom ID is unique and only one document should match
        var userId = userQuerySnapshot.docs.first.id;

        // Now that you have the Firebase document ID, you can query the 'stocks' sub-collection
        QuerySnapshot stocksQuerySnapshot = await FirebaseFirestore.instance
            .collection('Users')
            .doc(userId)
            .collection("FavStocks")
            .get();

        for (var doc in stocksQuerySnapshot.docs) {
          favStocks.add(Stock(name: doc["name"], code: doc["code"]));
        }
        return favStocks;
      } else {
        return favStocks;
      }
    } catch (e) {
      print(e);
      return favStocks;
    }
  }

  Future<void> addAStock(String userID, String name, String code) async {
    try {
      QuerySnapshot user = await FirebaseFirestore.instance
          .collection('Users')
          .where('userId', isEqualTo: userID)
          .get();

      var userId = user.docs.first.id;

      CollectionReference favouritesCollection = FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .collection('FavStocks');

      favouritesCollection.add({
        'name': name,
        'code': code,
      });
    } catch (err) {
      print(err);
    }
  }

  Future<void> deleteStock(String customUserId, String stockCode) async {
    try {
      // Query the 'Users' collection to find the document with the matching custom ID
      QuerySnapshot userQuerySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('userId', isEqualTo: customUserId)
          .get();

      // Check if a document with the custom ID exists
      if (userQuerySnapshot.docs.isNotEmpty) {
        // Assuming the custom ID is unique and only one document should match
        var userId = userQuerySnapshot.docs.first.id;

        // Now that you have the Firebase document ID, you can query the 'stocks' sub-collection
        QuerySnapshot stocksQuerySnapshot = await FirebaseFirestore.instance
            .collection('Users')
            .doc(userId)
            .collection('FavStocks')
            .where('code', isEqualTo: stockCode)
            .get();

        if (stocksQuerySnapshot.docs.isNotEmpty) {
          var stockId = stocksQuerySnapshot.docs.first.id;

          await FirebaseFirestore.instance
              .collection('Users')
              .doc(userId)
              .collection('FavStocks')
              .doc(stockId)
              .delete();
        } else {}
      } else {}
    } catch (e) {
      print(e);
    }
  }

  Future<void> addTrans(String userID, String code, double price,
      double dollarAmount, double stockAmount) async {
    try {
      QuerySnapshot user = await FirebaseFirestore.instance
          .collection('Users')
          .where('userId', isEqualTo: userID)
          .get();

      var userId = user.docs.first.id;

      CollectionReference favouritesCollection = FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .collection('Transactions');

      favouritesCollection.add({
        'stockCode': code,
        'stockPrice': price,
        'dollarAmount': dollarAmount,
        'stockAmount': stockAmount,
        'open': 1,
        'profit': 0.0,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (err) {
      print(err);
    }
  }

  Future<List<Trans>> getTransactions(String customUserId) async {
    try {
      // Clear the list each time to prevent duplication
      trans.clear();

      // Query the 'Users' collection to find the document with the matching custom ID
      QuerySnapshot userQuerySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('userId', isEqualTo: customUserId)
          .get();

      // Check if a document with the custom ID exists
      if (userQuerySnapshot.docs.isNotEmpty) {
        // Assuming the custom ID is unique and only one document should match
        var userId = userQuerySnapshot.docs.first.id;

        // Query the 'Transactions' sub-collection
        QuerySnapshot stocksQuerySnapshot = await FirebaseFirestore.instance
            .collection('Users')
            .doc(userId)
            .collection("Transactions")
            .orderBy("open", descending: true)
            .orderBy("timestamp", descending: true)
            .get();

        // Populate the transactions list with the latest data
        for (var doc in stocksQuerySnapshot.docs) {
          trans.add(Trans(
              code: doc["stockCode"],
              dollarAmount: doc["dollarAmount"],
              priceBought: doc["stockPrice"],
              stockAmount: doc["stockAmount"],
              open: doc["open"] == 1,
              profit: doc["profit"],
              ID: doc.id));
        }
        return trans;
      } else {
        return trans;
      }
    } catch (e) {
      print(e);
      return trans; // Return the potentially cleared or empty list if an error occurs
    }
  }

  Future<void> closeTransaction(
      String customUserId, double profit, String transId) async {
    try {
      // Query the 'Users' collection to find the document with the matching custom ID
      QuerySnapshot userQuerySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('userId', isEqualTo: customUserId)
          .get();

      // Check if a document with the custom ID exists
      if (userQuerySnapshot.docs.isNotEmpty) {
        // Assuming the custom ID is unique and only one document should match
        var userId = userQuerySnapshot.docs.first.id;

        // Now that you have the Firebase document ID, you can query the 'stocks' sub-collection
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(userId)
            .collection("Transactions")
            .doc(transId)
            .update({
          "open": 0,
          "profit": profit,
        });

        final DocumentReference userDoc =
            FirebaseFirestore.instance.collection('Users').doc(userId);
        final DocumentSnapshot snapshot = await userDoc.get();

        final double currentTotalProfit = snapshot.get('totalProfit') as double;
        final double newTotalProfit = currentTotalProfit + profit;

        await FirebaseFirestore.instance
            .collection('Users')
            .doc(userId)
            .update({
          "totalProfit": newTotalProfit,
        });
      } else {}
    } catch (e) {
      print(e);
    }
  }

  Future<Map<String, double>> getDataForChart(String customUserId) async {
    final Map<String, double> dataMap = {};
    try {
      // Query the 'Users' collection to find the document with the matching custom ID
      QuerySnapshot userQuerySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('userId', isEqualTo: customUserId)
          .get();

      // Check if a document with the custom ID exists
      if (userQuerySnapshot.docs.isNotEmpty) {
        // Assuming the custom ID is unique and only one document should match
        var userId = userQuerySnapshot.docs.first.id;

        // Query the 'Transactions' sub-collection
        QuerySnapshot stocksQuerySnapshot = await FirebaseFirestore.instance
            .collection('Users')
            .doc(userId)
            .collection("Transactions")
            .where("open", isEqualTo: 1)
            .get();

        // Populate the transactions list with the latest data
        for (var doc in stocksQuerySnapshot.docs) {
          if (!dataMap.containsKey(doc['stockCode'])) {
            var currentPrice = await getPrice(doc["stockCode"]);

            dataMap[doc["stockCode"]] = currentPrice * doc["stockAmount"];
          } else {
            var currentPrice = await getPrice(doc["stockCode"]);
            dataMap.update(doc["stockCode"],
                (value) => value + currentPrice * doc["stockAmount"]);
          }
        }
        return dataMap;
      } else {
        return dataMap;
      }
    } catch (e) {
      print(e);
      return dataMap; // Return the potentially cleared or empty list if an error occurs
    }
  }

  Future<Map<String, double>> getSTocksForPerformers(
      String customUserId) async {
    final Map<String, double> stocks = {};
    final Map<String, ProfitHelper> profitHelpers = {};
    try {
      QuerySnapshot userQuerySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('userId', isEqualTo: customUserId)
          .get();

      if (userQuerySnapshot.docs.isNotEmpty) {
        var userId = userQuerySnapshot.docs.first.id;

        QuerySnapshot stocksQuerySnapshot = await FirebaseFirestore.instance
            .collection('Users')
            .doc(userId)
            .collection("Transactions")
            .where("open", isEqualTo: 1)
            .get();

        for (var doc in stocksQuerySnapshot.docs) {
          String stockCode = doc["stockCode"];
          double stockPrice =
              doc["stockPrice"].toDouble(); // Ensure this is a double
          if (profitHelpers.containsKey(stockCode)) {
            profitHelpers[stockCode]!.nrOfTrans++;
            profitHelpers[stockCode]!.sumOfPrices += stockPrice;
          } else {
            profitHelpers[stockCode] = ProfitHelper(
                code: stockCode, nrOfTrans: 1, sumOfPrices: stockPrice);
          }
        }

        for (var entry in profitHelpers.entries) {
          var stock = entry.value;
          var currentPrice = await getPrice(stock
              .code); // Ensure this function is correctly fetching current price
          double avg = stock.sumOfPrices / stock.nrOfTrans;
          double percentage = ((currentPrice - avg) * 100) / avg;
          stocks[stock.code] = percentage;
        }

        return stocks;
      } else {
        return stocks;
      }
    } catch (e) {
      print(e);
      return stocks;
    }
  }

  Future<double> getUnrealisedProfit(String customUserId) async {
    double profit = 0.0;
    try {
      // Query the 'Users' collection to find the document with the matching custom ID
      QuerySnapshot userQuerySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('userId', isEqualTo: customUserId)
          .get();

      // Check if a document with the custom ID exists
      if (userQuerySnapshot.docs.isNotEmpty) {
        // Assuming the custom ID is unique and only one document should match
        var userId = userQuerySnapshot.docs.first.id;

        // Query the 'Transactions' sub-collection
        QuerySnapshot stocksQuerySnapshot = await FirebaseFirestore.instance
            .collection('Users')
            .doc(userId)
            .collection("Transactions")
            .where("open", isEqualTo: 1)
            .get();

        // Populate the transactions list with the latest data
        for (var doc in stocksQuerySnapshot.docs) {
          var currentPrice = await getPrice(doc["stockCode"]);
          profit =
              profit + (currentPrice - doc["stockPrice"]) * doc["stockAmount"];
        }
        return profit;
      } else {
        return profit;
      }
    } catch (e) {
      print(e);
      return profit; // Return the potentially cleared or empty list if an error occurs
    }
  }

  Future<List<ProfitInTime>> getProfits(String customUserId) async {
    List<ProfitInTime> profits = [];
    try {
      // Clear the list each time to prevent duplication

      // Query the 'Users' collection to find the document with the matching custom ID
      QuerySnapshot userQuerySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('userId', isEqualTo: customUserId)
          .get();

      // Check if a document with the custom ID exists
      if (userQuerySnapshot.docs.isNotEmpty) {
        // Assuming the custom ID is unique and only one document should match
        var userId = userQuerySnapshot.docs.first.id;

        // Query the 'Transactions' sub-collection
        QuerySnapshot stocksQuerySnapshot = await FirebaseFirestore.instance
            .collection('Users')
            .doc(userId)
            .collection("Profits")
            .orderBy("day", descending: false)
            .get();

        // Populate the transactions list with the latest data
        for (var doc in stocksQuerySnapshot.docs) {
          Timestamp timestamp =
              doc["day"] as Timestamp; // Cast the Firestore Timestamp
          DateTime day = timestamp.toDate(); // Convert to DateTime
          double profit = doc["profit"]; // Assuming this is already a double

          profits.add(ProfitInTime(day, profit)); // Add to your list
        }
        return profits;
      } else {
        return profits;
      }
    } catch (e) {
      print(e);
      return profits; // Return the potentially cleared or empty list if an error occurs
    }
  }

  Future<double> getPrice(stockCode) async {
    try {
      var resp = await http
          .get(Uri.parse('http://10.0.2.2:5000/stock/$stockCode/time/1d'));
      // var resp = await http.get(Uri.parse('https://www.thunderclient.com/welcome'));

      var jsonData = jsonDecode(resp.body);
      return jsonData[0]['Close'];
    } catch (e) {
      print(e);
      return 0;
    }
  }
}
