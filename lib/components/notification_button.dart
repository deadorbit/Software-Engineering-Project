import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    required this.onPressed,
    required this.text,
    super.key,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 5),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0))),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
