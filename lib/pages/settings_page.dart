import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void goToPort() {
    Navigator.pushNamed(context, '/portfolio');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Wrap the button with a Center widget
        child: ElevatedButton(
          onPressed: goToPort,
          child: Text("Go"),
        ),
      ),
    );
  }
}
