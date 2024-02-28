import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/stock_model.dart';

class DataBase_Controller {
  DataBase_Controller();
  List<Stock> favStocks = [];

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
          favStocks.add(
              Stock(name: doc["name"], code: doc["code"], price: doc["price"]));
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
}
