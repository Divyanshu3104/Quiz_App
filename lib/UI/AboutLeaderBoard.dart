import 'package:flutter/material.dart';

class AboutLeaderBoard extends StatefulWidget {
  const AboutLeaderBoard({super.key});

  @override
  State<AboutLeaderBoard> createState() => _AboutLeaderBoardState();
}

class _AboutLeaderBoardState extends State<AboutLeaderBoard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "Leaderboard",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            Container(
              height: 600,
              margin: EdgeInsets.all(20),
              child: SizedBox(
                height: 300,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=580&q=80"),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text("Divyansh Joshi")
                          ],
                        ),
                        leading: Text(
                          "#${index + 1}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text("335",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                          thickness: 1,
                          color: Colors.purple,
                          indent: 10,
                          endIndent: 10,
                        ),
                    itemCount: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
