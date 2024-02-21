import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

class DataBase_Controller {
  DataBase_Controller();

  Future<String> getUsers() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('fav_stocks').get();
      for (var doc in querySnapshot.docs) {
        print('Name: ${doc['name']}, Price: ${doc["price"]}');
      }
      return "done";
    } catch (e) {
      print(e);
      return "error";
    }
  }
}
