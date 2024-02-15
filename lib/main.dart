import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'service/firebase_options.dart';
import 'service/MyApp.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var apiKey = "LFZKJR58QXIC3JVG";
  runApp(MyApp());
}
