import 'package:flutter/material.dart';

class AcheievementGetDialog {
  static dynamic dialog = Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    child: Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlutterLogo(
            size: 150,
          ),
          Text(
            "This is a Custom Dialog",
            style: TextStyle(fontSize: 20),
          ),
          ElevatedButton(
              onPressed: () {
              },
              child: Text("OK"))
        ],
      ),
    ),
  );
}
