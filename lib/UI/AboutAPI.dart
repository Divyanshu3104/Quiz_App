import 'package:flutter/material.dart';

class AboutApi extends StatelessWidget {
  const AboutApi({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
                child: const Text("API FROM OpenTbd",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)))));
  }
}
