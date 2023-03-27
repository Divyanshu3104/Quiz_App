import 'package:flutter/material.dart';

class AboutData extends StatelessWidget {
  const AboutData({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
                child: const Text("Developed With Love From A Fresher",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)))));
  }
}
