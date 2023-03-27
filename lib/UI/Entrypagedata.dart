import 'package:assignment/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

class EntryPageData extends StatefulWidget {
  const EntryPageData({super.key});

  @override
  State<EntryPageData> createState() => _EntryPageDataState();
}

class _EntryPageDataState extends State<EntryPageData> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Image.asset("assets/images/bulbimage.png"),
        )),
        Center(
          child: RichText(
            text: const TextSpan(
                text: 'Welcome To Our \n',
                style: TextStyle(color: Colors.black, fontSize: 30),
                children: <TextSpan>[
                  TextSpan(
                    text: '\n   Quiz App \n',
                    style: TextStyle(color: Colors.pinkAccent, fontSize: 40),
                  ),
                  TextSpan(text: '\n             👇')
                ]),
          ),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.center,
              width: size.width - 100,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Tap To Play",
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
