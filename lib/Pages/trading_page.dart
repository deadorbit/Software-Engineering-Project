import 'package:flutter/material.dart';

class TradinPage extends StatefulWidget {
  const TradinPage({super.key});

  @override
  State<TradinPage> createState() => _TradinPageState();
}

class _TradinPageState extends State<TradinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Align(
            alignment: Alignment.center,
            child: Text("Trading Page"),
          )),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
