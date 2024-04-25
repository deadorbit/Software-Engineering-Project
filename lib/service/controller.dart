import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:software_engineering_project/models/transaction_model.dart';

import '../models/stock_model.dart';

class DataBase_Controller {
  //final String uid;
  DataBase_Controller();

  List<Stock> favStocks = [];
  List<Trans> trans = [];

  // final CollectionReference favouritesCollection = FirebaseFirestore.instance
  //     .collection('Users')
  //     .doc()
  //     .collection('FavStocks');
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
      } else {}
    } catch (e) {
      print(e);
    }
  }
}
