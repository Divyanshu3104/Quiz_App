import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  var points;
  ResultScreen();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text("Your Score is : ${points.toString()}",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.black))),
        ],
      ),
    ));
  }
}
