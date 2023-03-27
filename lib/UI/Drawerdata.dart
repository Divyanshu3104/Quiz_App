import 'package:assignment/UI/AboutAPI.dart';
import 'package:assignment/UI/AboutLeaderBoard.dart';
import 'package:assignment/UI/Aboutdata.dart';
import 'package:flutter/material.dart';

class DrawerData extends StatefulWidget {
  const DrawerData({super.key});

  @override
  State<DrawerData> createState() => _DrawerDataState();
}

class _DrawerDataState extends State<DrawerData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1331&q=80"),
              radius: 50,
            ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black),
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Divyanshu Joshi",
          style: TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text("#335",
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(0.9))),
                const Text("Rank",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            GestureDetector(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutLeaderBoard()));
                },
                title: const Text("LeaderBoard",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                leading: const Icon(Icons.leaderboard_sharp),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutData()));
              },
              title: const Text("About",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              leading: const Icon(Icons.person),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutApi()));
              },
              title: const Text("Used API",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              leading: const Icon(Icons.api),
            )
          ],
        )
      ],
    );
  }
}
